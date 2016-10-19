class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :name
      t.integer :fiat, default: 0
      t.belongs_to :concept, foreign_key: true

      t.timestamps
    end
  end
end
