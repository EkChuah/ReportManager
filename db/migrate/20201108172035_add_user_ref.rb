class AddUserRef < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :fiches, :projects, column: :Projet
    add_foreign_key :note_categories, :fiches, column: :Fiche

    add_foreign_key :note_questions, :note_categories, column: :NoteCategorie
    add_foreign_key :note_categories, :categories, column: :Categorie

    add_foreign_key :note_questions, :questions, column: :Question

    add_foreign_key :questions, :categories, column: :Categorie
    add_foreign_key :liaison_categorie_type_projets, :categories, column: :CategorieID

    add_foreign_key :projects, :users, column: :EncadrantAca
    add_foreign_key :projects, :users, column: :EncadrantInd
    add_foreign_key :fiches, :users, column: :Eleve
    add_foreign_key :liaison_juries, :users, column: :MembreJury
    add_foreign_key :liaison_groupe_eleves, :users, column: :EleveID
    add_foreign_key :groupes, :users, column: :PresidentDeJury
    add_foreign_key :type_projets, :users, column: :Responsable

    add_foreign_key :liaison_juries, :groupes, column: :Groupe

    add_foreign_key :liaison_groupe_eleves, :groupes, column: :GroupeID

    add_foreign_key :projects, :groupes, column: :Groupe

    add_foreign_key :projects, :rapports, column: :Rapport
  end
end
