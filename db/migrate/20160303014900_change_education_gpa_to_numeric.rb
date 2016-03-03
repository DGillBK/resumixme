class ChangeEducationGpaToNumeric < ActiveRecord::Migration
  def self.up
    change_table :educations do |t|
      t.change :gpa, :numeric
    end
  end
  def self.down
    change_table :educations do |t|
      t.change :gpa, :integer
    end
  end
end
