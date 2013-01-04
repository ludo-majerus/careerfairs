class AddAttachmentEventPlanTechnicalInfoCatalogToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :event_plan
      t.attachment :technical_info
      t.attachment :catalog
    end
  end

  def self.down
    drop_attached_file :events, :event_plan
    drop_attached_file :events, :technical_info
    drop_attached_file :events, :catalog
  end
end
