class CreateContests < ActiveRecord::Migration[7.0]
  def change
    create_table :contests do |t|
      t.string :title
      t.date :date
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
