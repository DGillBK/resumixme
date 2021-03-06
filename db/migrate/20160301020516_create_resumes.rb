class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :name
      t.string :skills
      t.string :languages
      t.string :interests
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
