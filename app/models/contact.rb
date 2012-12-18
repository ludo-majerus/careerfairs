class Contact < ActiveRecord::Base
	has_secure_password

  belongs_to :company
  attr_accessible :name, :login, :password, :password_confirmation, :email, :phone, :company_id
  
  validates :password, :presence => { :on => :create }
  #validates :email, :presence => true, :uniqueness => true
end
