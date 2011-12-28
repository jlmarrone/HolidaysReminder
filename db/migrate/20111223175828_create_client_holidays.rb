class CreateClientHolidays < ActiveRecord::Migration
  def change 
    create_table :client_holidays do |t|
      t.belongs_to :client
      t.belongs_to :holiday
      

      t.timestamps
    end
  end
end
