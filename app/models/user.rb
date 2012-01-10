class User < ActiveRecord::Base

  has_many :holidays, :dependent => :destroy
  accepts_nested_attributes_for :holidays
  has_many :clients, :dependent => :destroy
  accepts_nested_attributes_for :clients

  belongs_to :country
  belongs_to :state

  validates :name,  :uniqueness => true
  #validates :name, :password_confirmation,:presence => true

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }


  #  :storage => :s3,
  #  :s3_credentials => "/Users/admin/holidaysreminder/config/s3.yml",
  #  :path => ":attachment/:id/:style.:extension",
  #  :bucket => 'holidaysreminder'
  
  #scope :date_notification, inclue(:holidays).where("holidays.holiday_date < ?", f + 2.weeks).group("users.id")}

  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation,
  :avatar,:country_id,:state_id

   # Update record attributes without asking for the current password. Never allow to
   # change the current password
   
    
end
