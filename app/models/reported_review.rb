class ReportedReview < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :review
end
