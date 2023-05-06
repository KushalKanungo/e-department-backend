class ChangeDateToTimestampInTimetable < ActiveRecord::Migration[7.0]
  def up
    change_column :timetables, :date, :timestamp
  end

  def down
    change_column :timetables, :date, :date
  end
end
