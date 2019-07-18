class Admin::ReportedReviewsController < ApplicationController
  before_action :set_reported_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: [:show, :edit, :update, :destroy, :new, :index]
  # GET /reported_reviews
  # GET /reported_reviews.json
  def index
    @reported_reviews = ReportedReview.all
  end

  # GET /reported_reviews/1
  # GET /reported_reviews/1.json
  def show
  end

  # GET /reported_reviews/new
  def new
    @reported_review = ReportedReview.new
  end

  # GET /reported_reviews/1/edit
  def edit
  end

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

  # PATCH/PUT /reported_reviews/1
  # PATCH/PUT /reported_reviews/1.json
  def update
    respond_to do |format|
      if @reported_review.update(reported_review_params)
        format.html {redirect_to @reported_review, notice: 'Reported review was successfully updated.'}
        format.json {render :show, status: :ok, location: @reported_review}
      else
        format.html {render :edit}
        format.json {render json: @reported_review.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /reported_reviews/1
  # DELETE /reported_reviews/1.json
  def destroy
    @reported_review.destroy
    respond_to do |format|
      format.html {redirect_to admin_reported_reviews_url, notice: 'Reported review was successfully destroyed.'}
      format.json {head :no_content}
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
