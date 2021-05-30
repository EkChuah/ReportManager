class LiaisonGroupeElefe < ApplicationRecord
    belongs_to :groupe, foreign_key: "GroupeID"
    belongs_to :user, foreign_key: "EleveID"

    validates :GroupeID, presence: true
    validates :EleveID, presence: true
end
