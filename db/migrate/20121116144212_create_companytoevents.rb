class CreateCompanytoevents < ActiveRecord::Migration
  def change
    create_table :companytoevents do |t|
      t.integer :company_id
      t.integer :event_id

      t.timestamps
    end
  end
end
