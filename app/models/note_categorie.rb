class NoteCategorie < ApplicationRecord
    has_one :fiche, primary_key: "Fiche"
    has_many :note_questions, foreign_key: "NoteCategorie"
    has_one :categorie, primary_key: "Categorie"

    validates :Fiche, presence: true
    validates :Categorie, presence: true
end
