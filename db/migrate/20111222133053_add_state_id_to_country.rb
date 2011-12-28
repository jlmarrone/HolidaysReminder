class AddStateIdToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :state_id, :integer
  end
end
