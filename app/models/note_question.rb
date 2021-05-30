class NoteQuestion < ApplicationRecord
    has_one :note_categorie, primary_key: "NoteCategorie"
    has_one :question, primary_key: "Question"

    validates :NoteCategorie, presence: true
    validates :Question, presence: true
    
end
