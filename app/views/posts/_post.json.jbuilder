json.extract! post, :id, :profile_id, :post_text, :image_url, :created_at, :updated_at
json.url post_url(post, format: :json)
