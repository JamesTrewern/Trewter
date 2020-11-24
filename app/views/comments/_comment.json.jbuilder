json.extract! comment, :id, :post_id, :profile_id, :comment_text, :created_at, :updated_at
json.url comment_url(comment, format: :json)
