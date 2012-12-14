class Revisionofdbschema2 < ActiveRecord::Migration
  def change
    add_column :events, :subscription_open, :boolean
    add_column :events, :list_customers_open, :boolean
    add_column :events, :date_start, :date
    add_column :events, :date_end, :date
    add_column :events, :time_start, :time
    add_column :events, :time_end, :time
    add_column :events, :address, :string
    add_column :events, :city, :string
    add_column :events, :url_catalog, :string
    add_column :events, :url_technical_info, :string
    add_column :events, :url_event_plan, :string
    add_column :events, :date_end_customers, :date
    add_column :events, :date_end_badges, :date


  end
end
