class CreateConcepts < ActiveRecord::Migration[5.0]
  def change
    create_table :concepts do |t|
      t.string :name
      t.boolean :payment, default: false
      t.integer :fiat, default: 999
      t.belongs_to :course, foreign_key: true

      t.timestamps
    end
  end
end
