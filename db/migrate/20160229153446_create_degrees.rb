class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.string :level
      t.boolean :completed
      t.references :education, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
