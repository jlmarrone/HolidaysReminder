class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :password, :null => false
      t.string :password_confirmation, :null => false
      t.boolean :active

      t.timestamps
    end
  end
end
