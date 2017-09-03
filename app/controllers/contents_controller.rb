class ContentsController < ApplicationController
  include ApplicationHelper
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  def index
    limit = Setting.value(:posts_per_page).to_i
    @meta = {
      description: Setting.value(:site_description),
      site_name: Setting.value(:site_title),
      twitter: Setting.value(:twitter),
      url: Setting.value(:site_url),
    }
    @contents = Content.published.page(params[:page]).per(limit)
  end

  def archives
    @years = Content.published.all.group_by { |c| c.created_at.year }
    @meta = {
      description: Setting.value(:site_description),
      site_name: Setting.value(:site_title),
      twitter: Setting.value(:twitter),
      url: Setting.value(:site_url),
    }
  end

  def show
    @meta = {
      description: "#{@content.body[0..255]}...",
      site_name: Setting.value(:site_title),
      twitter: Setting.value(:twitter),
      url: Setting.value(:site_url),
      published_time: @content.created_at,
      modified_time: @content.updated_at,
      title: "#{@content.title} - #{Setting.value(:site_title)}",
      page_url: "Setting.value(:site_url)/#{blog_path(@content)}"
    }
  end

  private
  def set_content
    @content = Content.find_by(slug: params[:slug])
  end
end
