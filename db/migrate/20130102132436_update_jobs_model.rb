class UpdateJobsModel < ActiveRecord::Migration
  def change
    add_column :jobs, :title, :string
    add_column :jobs, :category, :string
    add_column :jobs, :experience, :string
  end
end
