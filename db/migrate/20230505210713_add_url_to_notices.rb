class AddUrlToNotices < ActiveRecord::Migration[7.0]
  def change
    add_column :notices, :url, :string
  end
end
