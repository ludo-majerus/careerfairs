class RevisionEventTableTmpFixTimeIssue < ActiveRecord::Migration
  def change

    remove_column :events, :time_start
    remove_column :events, :time_end
    remove_column :events, :date_start
    remove_column :events, :date_end
    add_column :events, :date_event, :date
    add_column :events, :time_start, :string
    add_column :events, :time_end, :string

  end
end
