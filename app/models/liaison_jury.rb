class LiaisonJury < ApplicationRecord
    
    belongs_to :user, foreign_key: "MembreJury"
    belongs_to :groupe, foreign_key: "Groupe"

    validates :Groupe, presence: true
    validates :MembreJury, presence: true
end
