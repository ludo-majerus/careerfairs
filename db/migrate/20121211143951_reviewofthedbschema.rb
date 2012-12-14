class Reviewofthedbschema < ActiveRecord::Migration
  def change

    drop_table :companytoevent_details
    drop_table :event_details
    drop_table :job_details
    drop_table :subscription_details
    drop_table :company_details


    add_column :companies, :name, :string
    add_column :companies, :description, :text
    add_column :companies, :address, :string
    add_column :companies, :logo, :string
    add_column :companies, :website, :string
    add_column :companies, :formlocked, :boolean
    add_column :companies, :badgeslocked, :boolean
    add_column :companies, :lunch, :integer

    add_column :companytoevents, :stand_size, :integer
    add_column :companytoevents, :stand_id, :string
    add_column :companytoevents, :lunch, :integer
    add_column :companytoevents, :desk, :integer
    add_column :companytoevents, :chair, :integer
    add_column :companytoevents, :table, :integer
    add_column :companytoevents, :trash, :integer
    add_column :companytoevents, :clothesrack, :integer
    add_column :companytoevents, :shelf, :integer

    create_table :contact do |t|
      t.integer :company_id
      t.string :name
      t.string :login
      t.string :password
      t.string :email
      t.string :phone

      t.timestamps
    end

  end
end
