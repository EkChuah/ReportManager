class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.integer :Projet
      t.integer :EncadrantAca
      t.integer :EncadrantInd
      t.integer :Groupe
      t.integer :Rapport
      t.string :Titre
      t.string :Description
      t.datetime :DateDebut
      t.datetime :DateFin
      t.integer :StatutA
      t.integer :StatutB
      t.integer :StatutC
      t.integer :StatutD
      t.integer :StatutE
      t.integer :StatutF
      t.integer :StatutG
      t.datetime :DateRenduRapport
      t.datetime :DateEvaluation
      t.datetime :DateNotation
      t.datetime :DateSoutenance
      t.boolean :RetardRendu
      t.datetime :DateNotationSoutenance

      t.timestamps
    end
  end
end
