class ChangeDataTypeForUserPhone < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.change :phone, :integer
    end
  end
  def self.down
    change_table :users do |t|
      t.change :phone, :sting
    end
  end
end
