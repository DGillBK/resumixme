class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password_digest
      t.integer :phone
      t.string :url
      t.string :linkedin

      t.timestamps null: false
    end
  end
end
