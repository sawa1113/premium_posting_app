json.posts @posts do |post|
  json.id post.id
  json.title post.title
  json.description post.description
  json.created_at post.created_at
  json.updated_at post.updated_at
end
