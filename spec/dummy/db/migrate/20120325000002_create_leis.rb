class CreateLeis < ActiveRecord::Migration
  def change
    create_table :leis do |t|

      t.timestamps
    end
  end
end
