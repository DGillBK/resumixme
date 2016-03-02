class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :name
      t.date :startDate
      t.date :endDate
      t.integer :gpa
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
