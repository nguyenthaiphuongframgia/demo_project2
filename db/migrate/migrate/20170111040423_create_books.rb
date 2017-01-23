class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.integer :status, default:0
      t.integer :numper_page
      t.references :category, foreign_key: true
      t.references :publisher, foreign_key: true

      t.timestamps
    end
  end
end
