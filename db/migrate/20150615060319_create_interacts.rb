class CreateInteracts < ActiveRecord::Migration
  def change
    create_table :interacts do |t|
      t.integer :m1
      t.integer :m2
      t.string :source

      t.timestamps null: false
    end
  end
end
