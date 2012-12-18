class AddPAsswordColumnToUser < ActiveRecord::Migration
  def change
    add_column :contacts, :password_digest, :string
  end
end
