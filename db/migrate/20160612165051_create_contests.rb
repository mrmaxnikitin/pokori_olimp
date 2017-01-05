class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :title, null: false
      t.text :description
      t.string :category, null: false
      t.string :age
      t.boolean :active, default: true
      t.string :image
      t.string :reward_number

      t.timestamps null: false
    end
  end
end
