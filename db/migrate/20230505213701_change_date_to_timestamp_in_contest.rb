class ChangeDateToTimestampInContest < ActiveRecord::Migration[7.0]
  def up
    change_column :contests, :date, :timestamp
  end

  def down
    change_column :contests, :date, :date
  end
end
