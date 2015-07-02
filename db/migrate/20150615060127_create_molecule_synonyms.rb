class CreateMoleculeSynonyms < ActiveRecord::Migration
  def change
    create_table :molecule_synonyms do |t|
      t.references :molecule, index: true
      t.string :synonym

      t.timestamps null: false
    end
    add_foreign_key :molecule_synonyms, :molecules
  end
end
