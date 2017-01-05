class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :category, null: false, default: 1
      t.text :text, null: false
      t.string :var1
      t.string :var2
      t.string :var3
      t.string :var4
      t.string :answer, null: false
      t.string :image
      t.string :background_color
      t.references :contest, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
