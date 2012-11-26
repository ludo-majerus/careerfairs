class CompanyDetail < ActiveRecord::Base
  belongs_to :company
  attr_accessible :company_id, :key, :value

end
