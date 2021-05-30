class CreateNoteCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :note_categories do |t|
      t.integer :Fiche
      t.integer :Categorie

      t.timestamps
    end
  end
end
