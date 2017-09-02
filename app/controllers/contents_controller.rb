class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  def index
    limit = Setting.value(:posts_per_page).to_i
    @contents = Content.page(params[:page]).per(limit)
  end

  def archives
    @years = Content.all.group_by { |c| c.created_at.year }
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_content
    @content = Content.find_by(slug: params[:slug])
  end
end
