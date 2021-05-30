class User < ApplicationRecord

    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    #Permet de crypter les mots de passes
    has_secure_password

    #Permet de vérifier la présence et la forme des éléments avant de les sauvegarder dans la base de donnée 
    
    validates :Prenom, presence: true
    validates :email, presence: true, format: { with: email_regex }

    validates :Nom, presence: true
    validates :password_digest, presence: true
    validates :Langue, presence: true

    #Définition des liens entre les tables via les clés étrangères
    has_many :fiches, foreign_key: "Eleve"
    has_many :type_projets, foreign_key: "Responsable"
    has_many :projets, foreign_key: "EncadrantAca"
    has_many :projets, foreign_key: "EncadrantInd"
    has_many :groupes, foreign_key: "PresidentDeJury"

    #Jointure entre la table Users et la table Groupes via la table LiaisonGroupeEleves
    has_many :liaison_groupe_eleves,foreign_key: "EleveID",source: "liaison_groupe_eleves"
    has_many :groupes, through: :liaison_groupe_eleves,foreign_key: "id"
    #Jointure entre la table Users et la table Groupes via la table LiaisonJuries
    has_many :liaison_juries,foreign_key: "MembreJury",source: "liaison_juries"
    has_many :groupes, through: :liaison_juries,foreign_key: "id"
    
end



