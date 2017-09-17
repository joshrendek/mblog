class ContentFile < ApplicationRecord
  belongs_to :contentable, polymorphic: true

  has_attached_file :attachment

  validates_attachment_content_type :attachment, content_type: /\Aimage/

  default_scope -> { order('created_at desc') }

  def markdown_url
    "![](#{attachment.url})"
  end
end
