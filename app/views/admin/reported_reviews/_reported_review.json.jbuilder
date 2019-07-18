json.extract! reported_review, :id, :user_id, :movie_id, :review_id, :description, :created_at, :updated_at
json.url reported_review_url(reported_review, format: :json)
