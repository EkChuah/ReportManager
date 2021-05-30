class Project < ApplicationRecord
    has_many :fiches, foreign_key: "Projet"
    has_one :type_projet, primary_key: "Projet", foreign_key: "id"
    has_one :user, primary_key: "EncadrantAca", foreign_key: " id"
    has_one :user, primary_key: "EncadrantInd", foreign_key: " id"
    has_one :groupe, primary_key: "Groupe", foreign_key: "id"
    has_one :rapport, primary_key: "Rapport", foreign_key: "id"

    validates :Projet, presence: true
    validates :EncadrantAca, presence: true
    validates :EncadrantInd, presence: true
    validates :Groupe, presence: true
    validates :Titre, presence: true
    validates :DateDebut, presence: true
    validates :DateFin, presence: true
    validates :DateRenduRapport, presence: true
    validates :DateEvaluation, presence: true

end
