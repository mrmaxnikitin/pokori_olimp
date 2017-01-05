class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.string :title, null: false
      t.text :description
      t.string :category, null: false
      t.string :subject
      t.string :age
      t.boolean :active, default: true
      t.string :image

      t.timestamps null: false
    end
  end
end
