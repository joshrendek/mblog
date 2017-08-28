require 'rouge/plugins/redcarpet'
class HTML < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet # yep, that's it.
end

Rouge::Rails.configure do |config|
  config.default_colorscheme = "solarized-dark"
end
