class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable
  has_one_attached :avatar
  has_many :reviews, dependent: :destroy
  has_many :reported_reviews, dependent: :destroy
  has_many :movies
  has_and_belongs_to_many :favourite_movies, class_name: 'Movie'
end
