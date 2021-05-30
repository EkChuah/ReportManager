class Groupe < ApplicationRecord
    has_many :liaison_groupe_eleves, foreign_key: "GroupeID",source: "liaison_groupe_eleves"
    has_many :users, through: :liaison_groupe_eleves,foreign_key: "id"
    has_one :user,primary_key: "PresidentDeJury"

    # has_many :liaison_juries,foreign_key: "Groupe",source: "liaison_juries"
    # has_many :users, through: :liaison_juries,foreign_key: "id"

    validates :Nom, presence: true
end
