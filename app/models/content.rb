class Content < ApplicationRecord
  has_many :appreciations, dependent: :destroy
  has_many :content_files, as: :contentable, dependent: :destroy

  default_scope -> { order('created_at desc') }

  scope :published, -> { where(state: 'published') }
  scope :draft, -> { where(state: 'draft') }

  before_save :slugit

  after_save :cache_buster

  def cache_buster
    FileUtils.rm_rf "#{Rails.root}/public/cached_pages"
  end

  def self.recent
    limit(5)
  end

  def self.popular
    Content.unscoped.where(state: :published).joins(:appreciations).group("contents.id").order("count(appreciations.content_id) desc").limit(5)
  end

  def slugit
    self.slug = to_slug(self.slug || self.title)
  end

  def to_slug(s)
    # Perform transliteration to replace non-ascii characters with an ascii
    # character
    value = s.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n, '').to_s

    # Remove single quotes from input
    value.gsub!(/[']+/, '')

    # Replace any non-word character (\W) with a space
    value.gsub!(/\W+/, ' ')

    # Remove any whitespace before and after the string
    value.strip!

    # All characters should be downcased
    value.downcase!

    # Replace spaces with dashes
    value.gsub!(' ', '-')

    # Return the resulting slug
    value
  end
end
