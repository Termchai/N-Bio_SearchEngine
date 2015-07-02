class CreateExtractWords < ActiveRecord::Migration
  def change
    create_table :extract_words do |t|
      t.string :word

      t.timestamps null: false
    end
  end
end
