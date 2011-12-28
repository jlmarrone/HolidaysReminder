class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.string :description, :null => false
      t.datetime :holiday_date, :null =>false 

      t.timestamps
    end
  end
end
