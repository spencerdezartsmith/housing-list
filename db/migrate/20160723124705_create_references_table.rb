class CreateReferencesTable < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.integer :receiver_id, presence: true
      t.integer :author_id, presence: true
      t.text :reference, presence: true

      t.timestamps null: false
    end
  end
end
