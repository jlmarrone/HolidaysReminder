class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :State_Name, :null => false

      t.timestamps
    end
  end
end
