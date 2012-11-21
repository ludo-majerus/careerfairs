class Company < ActiveRecord::Base
  attr_accessible :login, :name, :password
end
