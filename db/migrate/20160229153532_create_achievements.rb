class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :name
      t.string :description
      t.references :education, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
