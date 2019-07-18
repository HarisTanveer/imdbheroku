class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :genre
      t.string :release_date
      t.float :rating
      t.timestamps
    end
  end
end
