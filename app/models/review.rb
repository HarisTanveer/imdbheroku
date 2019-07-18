class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  paginates_per 3
  validates_uniqueness_of :user_id, scope: [:movie_id]
  has_many :reported_reviews, dependent: :destroy

  after_save do |review|
    movie = review.movie
    movie.rating = movie.reviews.average(:rating)
    movie.save
  end

  after_destroy do |review|
    movie = review.movie
    movie.rating = movie.reviews.average(:rating)
    movie.save
  end
end
