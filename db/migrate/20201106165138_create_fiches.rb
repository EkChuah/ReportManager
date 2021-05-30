class CreateFiches < ActiveRecord::Migration[6.0]
  def change
    create_table :fiches do |t|
      t.integer :Projet, index=true
      t.integer :Eleve
      t.boolean :Travail
      t.boolean :Rapport
      t.boolean :Soutenance
      t.string :Commentaire

      t.timestamps
    end
  end
end
