class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :login
      t.string :password

      t.timestamps
    end
  end
end
