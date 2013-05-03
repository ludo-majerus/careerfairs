class CreatePage < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
