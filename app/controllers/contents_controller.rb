class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  def index
    @contents = Content.limit(5)
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
