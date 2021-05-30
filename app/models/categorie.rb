class Categorie < ApplicationRecord
    has_many :note_categories, foreign_key: "Categorie"
    has_many :questions, foreign_key: "Categorie"
    has_one :liaison_categorie_type_projet, foreign_key: "CategorieID"
    has_one :type_projet, through: :liaison_categorie_type_projet,foreign_key: "id"

    validates :Numero, presence: true
    validates :Intitule, presence: true

end
