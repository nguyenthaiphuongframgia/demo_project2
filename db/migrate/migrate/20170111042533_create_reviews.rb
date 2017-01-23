class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rate, default: 0
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
