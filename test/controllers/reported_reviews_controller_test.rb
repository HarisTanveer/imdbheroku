require 'test_helper'

class ReportedReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reported_review = reported_reviews(:one)
  end

  test "should get index" do
    get reported_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_reported_review_url
    assert_response :success
  end

  test "should create reported_review" do
    assert_difference('ReportedReview.count') do
      post reported_reviews_url, params: { reported_review: { description: @reported_review.description, movie_id: @reported_review.movie_id, review_id: @reported_review.review_id, user_id: @reported_review.user_id } }
    end

    assert_redirected_to reported_review_url(ReportedReview.last)
  end

  test "should show reported_review" do
    get reported_review_url(@reported_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_reported_review_url(@reported_review)
    assert_response :success
  end

  test "should update reported_review" do
    patch reported_review_url(@reported_review), params: { reported_review: { description: @reported_review.description, movie_id: @reported_review.movie_id, review_id: @reported_review.review_id, user_id: @reported_review.user_id } }
    assert_redirected_to reported_review_url(@reported_review)
  end

  test "should destroy reported_review" do
    assert_difference('ReportedReview.count', -1) do
      delete reported_review_url(@reported_review)
    end

    assert_redirected_to reported_reviews_url
  end
end
