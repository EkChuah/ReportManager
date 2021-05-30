class Rapport < ApplicationRecord
    has_one_attached :pdf
    has_one_attached :conf
    has_one :projet, foreign_key: "Rapport"
end
