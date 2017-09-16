class Appreciation < ApplicationRecord
  belongs_to :content
  validates :ip_address, uniqueness: { scope: :content_id }

  after_create :clear_cache

  def clear_cache
    FileUtils.rm_rf "#{Rails.root}/public/cached_pages"
  end
end
