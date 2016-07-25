class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email, presence: true, uniqueness: true
      t.string :password_digest
      t.text :description, presence: true

      t.timestamps null: false
    end
  end
end
