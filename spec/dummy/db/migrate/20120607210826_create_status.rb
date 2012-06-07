class CreateStatus < ActiveRecord::Migration
  def change
    create_table :status do |t|
      t.string :name
      t.references :lei

      t.timestamps
    end
    add_index :status, :lei_id
  end
end
