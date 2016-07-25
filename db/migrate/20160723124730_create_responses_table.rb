class CreateResponsesTable < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :listing_id, presence: true
      t.integer :author_id, presence: true
      t.text :response, presence: true

      t.timestamps null: false
    end
  end
end
