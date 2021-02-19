class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.belongs_to :category, index: true, foreign_key: true
    end
  end
end
