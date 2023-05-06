class ChangeDateToTimestampInNotice < ActiveRecord::Migration[7.0]
  def up
    change_column :notices, :date, :timestamp
  end

  def down
    change_column :notices, :date, :date
  end
end
