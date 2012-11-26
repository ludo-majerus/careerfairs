class CreateCompanyDetails < ActiveRecord::Migration
  def change
    create_table :company_details do |t|
      t.integer :company_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
