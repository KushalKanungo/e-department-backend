class CreateTimetables < ActiveRecord::Migration[7.0]
  def change
    create_table :timetables do |t|
      t.integer :semester
      t.string :title
      t.text :description
      t.date :date
      t.string :url
      t.boolean :active

      t.timestamps
    end
  end
end
