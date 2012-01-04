class ClientNotification < ActiveRecord::Base
  
  belongs_to :client, :dependent => :destroy
  belongs_to :holiday, :dependent => :destroy

  scope :holidays_notificated, lambda { |holidays| where(:holiday_id => holidays)}
end
