class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :subtitle
      t.text :description
      t.decimal :price, precision: 14, scale: 2, default: 0.0
      t.boolean :active, default: false
      t.boolean :deleted, default: false
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
