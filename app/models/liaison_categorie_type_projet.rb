class LiaisonCategorieTypeProjet < ApplicationRecord
    belongs_to :categorie, foreign_key: "CategorieID"
    belongs_to :type_projet, foreign_key: "TypeProjetID"

    validates :CategorieID, presence: true
    validates :TypeProjetID, presence: true
end
