class CreateLiaisonCategorieTypeProjets < ActiveRecord::Migration[6.0]
  def change
    create_table :liaison_categorie_type_projets do |t|
      t.integer :CategorieID
      t.integer :TypeProjetID
      t.boolean :Travail
      t.boolean :Rapport
      t.boolean :Soutenance

      t.timestamps
    end
  end
end
