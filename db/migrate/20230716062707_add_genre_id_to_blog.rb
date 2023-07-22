class AddGenreIdToBlog < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :genre_id, :integer
  end
end
