json.extract! movie, :id, :title, :description, :genre, :release_date, :rating, :created_at, :updated_at
json.url movie_url(movie, format: :json)
