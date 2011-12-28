class AddClientIdToHoliday < ActiveRecord::Migration
  def change
    add_column :holidays, :client_id, :integer
  end
end
