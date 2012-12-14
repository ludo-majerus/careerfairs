class Contact < ActiveRecord::Base
  belongs_to :company
  attr_accessible :name, :login, :password, :email, :phone, :company_id
end
