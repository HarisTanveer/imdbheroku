class AddDirectorToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :director, :string
    add_column :movies, :writer, :string
    add_column :movies, :run_time, :string
  end
end
