class CreateResponsibilities < ActiveRecord::Migration
  def change
    create_table :responsibilities do |t|
      t.text :description
      t.references :position, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
