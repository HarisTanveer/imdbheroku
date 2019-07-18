json.extract! review, :id, :description, :user_id_id, :movie_id_id, :status, :rating, :created_at, :updated_at
json.url review_url(review, format: :json)
