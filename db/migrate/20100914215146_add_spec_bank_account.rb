class AddSpecBankAccount < ActiveRecord::Migration
  def self.up
    add_column :specs, :bank_name, :string
    add_column :specs, :occupation, :string
  end

  def self.down
    remove_column :specs, :bank_name
    remove_column :specs, :occupation
  end
end

