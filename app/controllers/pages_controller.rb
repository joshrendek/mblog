class PagesController < ApplicationController
  before_action :set_page, only: [:show]

  def show
    @meta = {
      description: "#{@page.body[0..255]}...",
      site_name: Setting.value(:site_title),
      twitter: Setting.value(:twitter),
      url: Setting.value(:site_url),
      published_time: @page.created_at,
      modified_time: @page.updated_at,
      title: "#{@page.title} - #{Setting.value(:site_title)}",
      page_url: "Setting.value(:site_url)/#{@page.slug}"
    }
  end

  private
  def set_page
    @page = Page.published.find_by(slug: params[:slug])
    @page = Page.find_by(slug: params[:slug]) if params[:preview]
    not_found if @page.nil?
  end

  def not_found
    raise ActionController::RoutingError.new('Content not found')
  end

end
