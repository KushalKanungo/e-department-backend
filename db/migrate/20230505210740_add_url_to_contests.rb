class AddUrlToContests < ActiveRecord::Migration[7.0]
  def change
    add_column :contests, :url, :string
  end
end
