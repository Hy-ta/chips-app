class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :desc
      t.text :content
      t.string :img
      t.integer :user_id
      t.datetime :event_date

      t.timestamps
    end
  end
end
