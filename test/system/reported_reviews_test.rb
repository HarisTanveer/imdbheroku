require "application_system_test_case"

class ReportedReviewsTest < ApplicationSystemTestCase
  setup do
    @reported_review = reported_reviews(:one)
  end

  test "visiting the index" do
    visit reported_reviews_url
    assert_selector "h1", text: "Reported Reviews"
  end

  test "creating a Reported review" do
    visit reported_reviews_url
    click_on "New Reported Review"

    fill_in "Description", with: @reported_review.description
    fill_in "Movie", with: @reported_review.movie_id
    fill_in "Review", with: @reported_review.review_id
    fill_in "User", with: @reported_review.user_id
    click_on "Create Reported review"

    assert_text "Reported review was successfully created"
    click_on "Back"
  end

  test "updating a Reported review" do
    visit reported_reviews_url
    click_on "Edit", match: :first

    fill_in "Description", with: @reported_review.description
    fill_in "Movie", with: @reported_review.movie_id
    fill_in "Review", with: @reported_review.review_id
    fill_in "User", with: @reported_review.user_id
    click_on "Update Reported review"

    assert_text "Reported review was successfully updated"
    click_on "Back"
  end

  test "destroying a Reported review" do
    visit reported_reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reported review was successfully destroyed"
  end
end
