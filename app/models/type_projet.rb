class TypeProjet < ApplicationRecord
    validates :Nom, presence: true
    validates :DureeSoutenanceExpose, presence: true, numericality: true
    validates :DureeSoutenanceQuestions, presence: true, numericality: true
    validates :Responsable, presence: true
    has_one :liaison_categorie_type_projet, foreign_key: "TypeProjetID"
    has_one :categorie,through: :liaison_categorie_type_projet 
    has_many :projets, foreign_key: "Projet"
    has_one :user, foreign_key: "id", primary_key: "Responsable"


    
end
