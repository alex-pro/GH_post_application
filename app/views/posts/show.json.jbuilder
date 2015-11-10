json.(@post, :id, :title, :body, :tags)
json.(@post.user, :name)
