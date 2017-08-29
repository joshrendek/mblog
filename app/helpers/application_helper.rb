module ApplicationHelper
  def blog_path(content)
    blog_internal_path(year: content.created_at.year, month: content.created_at.month, slug: content.slug)
  end
end
