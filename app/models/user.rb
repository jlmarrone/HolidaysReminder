class User < ActiveRecord::Base

  has_many :holidays, :dependent => :destroy
  accepts_nested_attributes_for :holidays
  has_many :clients, :dependent => :destroy
  accepts_nested_attributes_for :clients
  
  belongs_to :country
  belongs_to :state
  
  scope :date_notification, lambda{|f| joins(:holidays).where("holidays.holiday_date < ?", f + 2.weeks).group("users.id")}

  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
end
