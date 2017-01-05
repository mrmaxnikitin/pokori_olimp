class EmailToRewards < ActiveRecord::Migration
  def change
  	add_column :rewards, :email, :string
  end
end
