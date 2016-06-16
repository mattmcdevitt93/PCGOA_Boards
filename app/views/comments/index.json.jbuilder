json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :type
  json.url comment_url(comment, format: :json)
end
