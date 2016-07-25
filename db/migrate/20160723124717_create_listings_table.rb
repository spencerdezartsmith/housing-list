class CreateListingsTable < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title, presence: true
      t.text :description, presence: true
      t.string :location, presence: true
      t.integer :price, presence: true
      t.integer :manager_id, presence: true

      t.timestamps null: false
    end
  end
end
