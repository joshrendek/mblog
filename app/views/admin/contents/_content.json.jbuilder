json.extract! content, :id, :name, :body, :slug, :created_at, :updated_at
json.url content_url(content, format: :json)
