class ReportedReviewsController < ApplicationController
  before_action :set_reported_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: [:show, :edit, :update, :destroy, :new, :index]

  # POST /reported_reviews
  # POST /reported_reviews.json
  def create
    @reported_review = ReportedReview.new(reported_review_params)

    respond_to do |format|
      if @reported_review.save
        format.js {render :create}
      else
        format.html {render :new}
        format.json {render json: @reported_review.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reported_review
    @reported_review = ReportedReview.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reported_review_params
    params.require(:reported_review).permit(:user_id, :movie_id, :review_id, :description)
  end

  def authenticate_admin!
    redirect_to root_path unless current_user.admin?
  end
end
