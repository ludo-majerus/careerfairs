class CreateTableEmails < ActiveRecord::Migration
  def change
  	create_table :emails do |t|
      t.string :subject
      t.text :html_content
      t.string :from_email
      t.string :from_name
      t.timestamps
    end
  end
end
