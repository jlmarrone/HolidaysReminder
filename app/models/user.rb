class User < ActiveRecord::Base

  has_many :holidays, :dependent => :destroy
  has_many :clients, :dependent => :destroy
  belongs_to :country
  belongs_to :state

  

  validates :name , :presence => true
  validates :email , :presence => true
  validates_uniqueness_of :name
  validates :password , :presence => true
  validates :password_confirmation , :presence => true
  
  scope :date_notification, lambda{|f| joins(:holidays).where("holidays.holiday_date < ?", f + 2.weeks).group("users.id")}

  def self.authenticate(email, password)
    user = find_by_email_and_password(email,password)
    if user && user.password == password
      user
    else
      nil
    end
  end

  def delivering
   sleep 10 # placeholder for sending email
   update_attribute(:updated_at, Time.now)
  end  


end
