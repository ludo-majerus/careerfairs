class CreateJobseekers < ActiveRecord::Migration
  def change
    create_table :jobseekers do |t|
      t.string :userDID
      t.string :userEmail

      t.timestamps
    end
  end
end
