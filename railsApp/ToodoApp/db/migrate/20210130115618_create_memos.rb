class CreateMemos < ActiveRecord::Migration[6.1]
  def change
    create_table :memos do |t|
      t.bigint :user_id
      t.bigint :tag_id
      t.text :content

      t.timestamps
    end
  end
end
