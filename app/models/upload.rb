# == Schema Information
#
# Table name: uploads
#
#  id                  :integer          not null, primary key
#  upload_file_name    :string
#  upload_content_type :string
#  upload_file_size    :integer
#  upload_updated_at   :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  sort_order          :integer          default(0), not null
#

class Upload < ActiveRecord::Base
  #attr_accessible :upload

  has_attached_file :upload,
                    :path => ":rails_root/public/system/users/images/:id/:style/:filename",
                    :url => "/system/users/images/:id/:style/:filename",
                    :default_url => "/images/:style/missing.png",
                    :styles => { :medium => "300x300>", :thumb => "100x100#" }
  validates_attachment_content_type :upload, :content_type => /\Aimage\/.*\Z/

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "sort_order"=> read_attribute(:sort_order),
      #"thumbnail_url" => upload.url(:original),
      "thumbnail_url" => upload.url(:thumb),
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE"
    }
  end

end
