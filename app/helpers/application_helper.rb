module ApplicationHelper
  def blog_path(content)
    month = content.created_at.strftime("%m")
    blog_internal_path(year: content.created_at.year, month: month, slug: content.slug)
  end

  def blog_appr_path(content)
    # TODO: figure out wtf this is needed
    return unless content.kind_of? Content
    month = content.created_at.strftime("%m")
    blog_appreciate_path(year: content.created_at.year, month: month, slug: content.slug)
  end
end
