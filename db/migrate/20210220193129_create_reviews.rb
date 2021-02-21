class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :content
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :restaurant, index: true, foreign_key: true


      t.timestamps
    end
  end
end
