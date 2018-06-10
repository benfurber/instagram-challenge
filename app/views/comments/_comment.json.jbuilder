json.extract! comment, :id, :user, :body, :post, :created_at, :updated_at
json.url comment_url(comment, format: :json)
