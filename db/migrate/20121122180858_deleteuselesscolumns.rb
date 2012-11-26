class Deleteuselesscolumns < ActiveRecord::Migration
  def change
    remove_column :companies, :name
    remove_column :companies, :login
    remove_column :companies, :password

    remove_column :events, :site_id
    remove_column :events, :date
    remove_column :events, :hour_begin
    remove_column :events, :hour_end
    remove_column :events, :location

    remove_column :jobs, :title

    drop_table :jobseekers
    drop_table :subscribers


  end
end
