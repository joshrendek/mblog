module ApplicationHelper
  def blog_path(content)
    month = content.created_at.strftime("%m")
    blog_internal_path(year: content.created_at.year, month: month, slug: content.slug)
  end
end
