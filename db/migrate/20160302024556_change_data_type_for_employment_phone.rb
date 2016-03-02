class ChangeDataTypeForEmploymentPhone < ActiveRecord::Migration
  def self.up
    change_table :employments do |t|
      t.change :phone, :string
    end
  end
  def self.down
    change_table :employments do |t|
      t.change :phone, :integer
    end
  end
end
