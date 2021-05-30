class Question < ApplicationRecord
    has_many :note_questions, foreign_key: "Question"
    has_one :categorie, primary_key: "Categorie"

    validates :Numero, presence: true
    validates :Categorie, presence: true
    validates :Intitule, presence: true
    validates :MaxNote, presence: true
    
end
