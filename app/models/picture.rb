# == Schema Information
#
# Table name: pictures
#
#  id                 :integer          not null, primary key
#  type               :string           not null
#  caption            :text
#  parent_type        :string           not null
#  parent_id          :integer          not null
#  sort_order         :integer          default(0), not null
#  image_fingerprint  :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Picture < ApplicationRecord
  include Sortable

  belongs_to :parent, polymorphic: true, touch: true

  alias sortable_parent parent

  validates :parent, presence: true
end
