json.array!(@posts) do |post|
  json.(post, :id, :title, :body, :tags)
  json.(post.user, :name)
end
