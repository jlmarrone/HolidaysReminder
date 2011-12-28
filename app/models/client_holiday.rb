class ClientHoliday < ActiveRecord::Base

belongs_to :client, :dependent => :destroy
belongs_to :holiday, :dependent => :destroy

end