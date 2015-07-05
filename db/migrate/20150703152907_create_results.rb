class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :name
      t.string :time_spend
      t.string :duplicate
      t.string :output

      t.timestamps null: false
    end
  end
end
