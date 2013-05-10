class AddDefaultValues < ActiveRecord::Migration
  
  def self  
  	
  	change_table :companytoevents do |t|  

	t.integer :lunch, :default => 0, :null => false
	t.integer :desk, :default => 0, :null => false
	t.integer :chair, :default => 0, :null => false
	t.integer :table, :default => 0, :null => false
	t.integer :trash, :default => 0, :null => false
	t.integer :clothesrack, :default => 0, :null => false
	t.integer :shelf, :default => 0, :null => false

	end
  end
end
