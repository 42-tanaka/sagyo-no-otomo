json.extract! post, :id, :title, :body, :image, :eaten, :smell, :sound, :spill, :hands_dirty, :created_at, :updated_at
json.url post_url(post, format: :json)
