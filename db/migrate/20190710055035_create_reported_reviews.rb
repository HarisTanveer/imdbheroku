class CreateReportedReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reported_reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
