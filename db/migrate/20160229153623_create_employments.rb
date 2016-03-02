class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.string :name
      t.date :startDate
      t.date :endDate
      t.string :address
      t.integer :phone
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
