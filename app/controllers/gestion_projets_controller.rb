class GestionProjetsController < ApplicationController

    def index 
        @typeProjets=TypeProjet.all
        @projectsInd=Project.where("EncadrantInd= ? ",current_user.id)
        @projectsAca=Project.where("EncadrantAca= ? ",current_user.id)
        
        @projectsE=Project.joins("INNER JOIN liaison_groupe_eleves ON liaison_groupe_eleves.GroupeID=projects.Groupe").where("liaison_groupe_eleves.EleveID= ?",current_user.id)
        @typeProjetRespo=TypeProjet.where("Responsable= ?",current_user.id)
        
        
        respond_to do |format|
            format.html 
            format.js
        end
    end

    def mesProjets 
        
        @typeProjets=TypeProjet.all
        @projectsInd=Project.where("EncadrantInd= ? ",current_user.id)
        @projectsAca=Project.where("EncadrantAca= ? ",current_user.id)
        @projectsE=Project.joins("INNER JOIN liaison_groupe_eleves ON liaison_groupe_eleves.GroupeID=projects.Groupe").where("liaison_groupe_eleves.EleveID= ?",current_user.id)
        @typeProjetRespo=TypeProjet.where("Responsable= ?",current_user.id)
        
        
        respond_to do |format|
            format.html 
            format.js
        end
    end 

    def responsable 
        @typeProjetsRespo=TypeProjet.where("Responsable= ?",current_user.id).first
        @usersE = User.where("Eleve = ?", true)
        @usersI = User.where("Industriel = ?", true)
        @usersA = User.where("Academique = ?", true)
        @groupes = Groupe.all
        @projects=Project.where("Projet= ? ",@typeProjetsRespo.id)
        respond_to do |format|
            format.html 
            format.js
        end
    end 

    def mesSoutenances
        @projectsE=Project.joins("INNER JOIN liaison_groupe_eleves ON liaison_groupe_eleves.GroupeID=projects.Groupe").where("liaison_groupe_eleves.EleveID= ?",current_user.id)
        @typeProjets=TypeProjet.all
        @projectsInd=Project.where("EncadrantInd= ?",current_user.id)
        @projectsAca=Project.where("EncadrantAca= ?",current_user.id)
        respond_to do |format|
            format.html 
            format.js
        end
    end

    

    def projets_finis
        if current_user.Eleve
            @groupe= current_user.groupes
        end
        @typeProjets=TypeProjet.all
        @projectsInd=Project.where("EncadrantInd= ?",current_user.id)
        @projectsAca=Project.where("EncadrantAca= ?",current_user.id)
        respond_to do |format|
            format.html 
            format.js
        end

    end


    



end
