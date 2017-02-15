class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :meal
      t.time :times
      t.string :day
      t.string :payer
      t.boolean :is_public, default: true
      t.belongs_to :user
      t.timestamps null: false
    end

    add_index :books, [:user_id]
  end
end