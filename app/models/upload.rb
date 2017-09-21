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
      "url" => upload.url(:original),
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE" 
    }
  end

end
