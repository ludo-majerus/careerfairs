class AddCommentToCompany < ActiveRecord::Migration
  def change
  	    add_column :companies, :comment, :text
  end
end
