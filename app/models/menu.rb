class Menu < ApplicationRecord
  default_scope -> { order(order: :asc) }

  after_save :cache_buster

  def cache_buster
    FileUtils.rm_rf "#{Rails.root}/public/cached_pages"
  end
end
