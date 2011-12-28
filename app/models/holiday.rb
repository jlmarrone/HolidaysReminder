class Holiday < ActiveRecord::Base

  belongs_to :user
  belongs_to :country
  has_many :clients
  
  validates :description , :presence => true
  validates :holiday_date , :presence => true

  scope :date_notification, lambda{|f| where("holiday_date < ?",f + 2.weeks)}
end
