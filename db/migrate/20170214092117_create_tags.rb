class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :title
      t.timestamps null: false
    end

    create_table :books_tags do |t|
      t.integer :book_id
      t.integer :tag_id
    end
  end
end