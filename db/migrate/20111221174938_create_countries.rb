class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :Country_Name, :null => false

      t.timestamps
    end
  end
end
