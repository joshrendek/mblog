# Setup defaults for mblog here
unless ENV['SKIP_SETUP'].present?
  if Sidebar.count == 0
    Sidebar.create(title: 'Recent Posts', order: 0, body: '')
    Sidebar.create(title: 'Most Popular', order: 0, body: '')
  end
  if Menu.count == 0
    Menu.create(target: '/', name: 'Home', order: 0)
    Menu.create(target: '/archives', name: 'Archives', order: 1)
    Menu.create(target: '/categories', name: 'Categories', order: 2)
  end

  if Setting.count == 0
    Setting.create(name: :site_url, value: "http://example.com")
    Setting.create(name: :site_title, value: "My mblog")
    Setting.create(name: :site_subtitle, value: "The best way to blog")
    Setting.create(name: :site_description, value: "Powered by mblog")
    Setting.create(name: :posts_per_page, value: "5")
    Setting.create(name: :google_analytics, value: "UA-123")
    Setting.create(name: :twitter, value: "@")
    Setting.create(name: :disqus, value: "shortname")
  end
end
