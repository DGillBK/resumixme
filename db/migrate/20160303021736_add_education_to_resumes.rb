class AddEducationToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :education, :string
  end
end
