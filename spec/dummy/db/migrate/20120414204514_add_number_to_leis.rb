class AddNumberToLeis < ActiveRecord::Migration
  def change
    add_column :leis, :number, :string

  end
end
