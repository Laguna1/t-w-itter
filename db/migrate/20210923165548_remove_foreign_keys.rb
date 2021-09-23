class RemoveForeignKeys < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :likes, :tweets
    remove_foreign_key :likes, :users
  end
end
