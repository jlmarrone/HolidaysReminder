class Client < ActiveRecord::Base

  belongs_to :user
  belongs_to :country
  
  has_many :client_holidays
  has_many :client_notifications
  has_many :holidays, :through => :client_holidays

  before_save :cleanup
  
  validates :name,  :uniqueness => true
  validates :email, :name, :presence => true

  scope :notified_clients, where(:notified => false)
  

  protected

    def cleanup
      self[:name] = self[:name].capitalize
    end

end
