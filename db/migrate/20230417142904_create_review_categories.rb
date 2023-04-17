class CreateReviewCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :review_categories do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.belongs_to :review, index: true, foreign_key: true 
      t.timestamps
    end
  end
end
