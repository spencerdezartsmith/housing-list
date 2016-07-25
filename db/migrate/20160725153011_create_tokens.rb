class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :code
      t.integer :generator_id
      t.integer :new_member_id

      t.timestamps null: false
    end
  end
end
