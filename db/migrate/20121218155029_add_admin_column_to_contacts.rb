class AddAdminColumnToContacts < ActiveRecord::Migration
  def change
  	    add_column :contacts, :isadmin, :boolean
  end
end
