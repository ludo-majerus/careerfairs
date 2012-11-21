class CreateJobDetails < ActiveRecord::Migration
  def change
    create_table :job_details do |t|
      t.integer :job_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
