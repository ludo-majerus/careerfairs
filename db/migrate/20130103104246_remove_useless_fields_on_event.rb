class RemoveUselessFieldsOnEvent < ActiveRecord::Migration
  def change
  	    remove_column :events, :url_technical_info
  	    remove_column :events, :url_event_plan
  	    remove_column :events, :url_catalog
  end
end
