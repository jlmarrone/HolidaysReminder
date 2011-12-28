class AddNotifiedToHoliday < ActiveRecord::Migration
  def change
    add_column :holidays, :notified, :boolean
  end
end
