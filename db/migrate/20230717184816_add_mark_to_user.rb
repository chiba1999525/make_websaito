class AddMarkToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :mark, :boolean
  end
end
