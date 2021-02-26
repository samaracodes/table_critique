class AddCategoryIdToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_reference :restaurants, :category, foreign_key: true
  end
end
