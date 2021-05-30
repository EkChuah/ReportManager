class Fiche < ApplicationRecord

    has_many :note_categories, foreign_key: "Fiche"
    has_one :projet, primary_key: "Projet"
    has_one :user, primary_key: "Eleve"

    validates :Projet, presence: true
    validates :Eleve, presence: true
    
end
