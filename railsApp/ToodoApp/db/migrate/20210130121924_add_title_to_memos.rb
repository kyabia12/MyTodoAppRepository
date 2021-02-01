class AddTitleToMemos < ActiveRecord::Migration[6.1]
  def change
    add_column :memos, :title, :text
  end
end
