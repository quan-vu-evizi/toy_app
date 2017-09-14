# this needs to be included after has_attached_file, so it doesn't
# work in the base Picture class
module ValidatesImage
  extend ActiveSupport::Concern

  included do
    validates_attachment :image,
      content_type: {
        content_type: [/^image\/(?:jpeg|gif|png|jpg)$/, nil],
        message: "is not a supported file type"
      },
      size: { less_than: 8.megabytes, message: "must be less than 8MB" }
  end
end
