class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :name
      t.string :age
      t.string :institution
      t.integer :prize
      t.integer :score
      t.boolean :paid
      t.integer :number
      t.references :contest, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
