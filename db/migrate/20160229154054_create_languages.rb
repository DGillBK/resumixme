class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :language
      t.string :fluency
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
