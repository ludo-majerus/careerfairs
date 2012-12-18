class RemoveLoginToContact < ActiveRecord::Migration
  def change
  	    remove_column :contacts, :login
  end
end
