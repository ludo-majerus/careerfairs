class AddStatusToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :status, :int, :default => 0
  end
end
