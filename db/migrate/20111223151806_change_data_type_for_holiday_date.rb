class ChangeDataTypeForHolidayDate < ActiveRecord::Migration
  def up
    change_table :holidays do |t|
      t.change :holiday_date, :date
    end
  end

  def down
    change_table :holidays do |t|
      t.change :holiday_date, :date
    end
  end
end
