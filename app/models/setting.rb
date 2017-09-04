class Setting < ApplicationRecord
  after_save :clear_cache

  def clear_cache
    Rails.cache.delete("setting_#{name}")
    FileUtils.rm_rf "#{Rails.root}/public/cached_pages"
  end

  def self.value(key, default="")
    Rails.cache.fetch("setting_#{key}", expires_in: 12.hours)  do
      find_by(name: key).try(:value) || default
    end
  end
end
