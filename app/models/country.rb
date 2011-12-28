class Country < ActiveRecord::Base

 has_many :states, :dependent => :destroy
 has_many :users
 has_many :clients
 has_many :holidays
 
end
