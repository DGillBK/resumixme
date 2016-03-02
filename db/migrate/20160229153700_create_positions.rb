class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :title
      t.date :startDate
      t.date :endDate
      t.references :employment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
