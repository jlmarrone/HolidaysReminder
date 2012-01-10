class Holiday < ActiveRecord::Base

  belongs_to :user

  belongs_to :country

  has_many :clients
  has_many :client_notifications
  
  validates :description, :holiday_date, :presence => true

  scope :date_notification, where("holiday_date < ?",Date.today + 2.weeks)
end
