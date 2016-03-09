class CreateGlossaries < ActiveRecord::Migration
  def change
    create_table :glossaries do |t|
      t.string :name
      t.string :link
      t.string :hitone
      t.string :hittwo
      t.string :hitthree
      t.integer :x
      t.integer :y
      t.integer :z

      t.timestamps null: false
    end
  end
end
