class AddNotifiedToClient < ActiveRecord::Migration
  def change
    add_column :clients, :notified, :boolean
  end
end
