class RevisionOfStand < ActiveRecord::Migration
	def change
		add_column :stands, :company_id, :integer
		add_column :stands, :event_id, :integer
		remove_column :stands, :companytoevent_id
	end
end
