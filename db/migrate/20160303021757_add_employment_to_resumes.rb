class AddEmploymentToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :employment, :string
  end
end
