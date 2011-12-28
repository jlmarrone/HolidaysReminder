class AddHolidayIdToClient < ActiveRecord::Migration
  def change
    add_column :clients, :holiday_id, :integer
  end
end
