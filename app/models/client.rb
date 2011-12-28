class Client < ActiveRecord::Base

  belongs_to :user
  belongs_to :country
  has_many :client_holidays

  has_many :holidays, :through => :client_holidays

  validates :name , :presence => true
  validates :email , :presence => true

  scope :notified_clients,(where :notified => :false)
  
  before_save :cleanup

  def cleanup
    self[:name] = self[:name].capitalize
  end

end
