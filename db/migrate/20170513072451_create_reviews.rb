class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :account, index: true
      t.text :title
      t.text :description
      t.integer :rating
      t.text :sentiment
      t.timestamps
    end
  end
end
