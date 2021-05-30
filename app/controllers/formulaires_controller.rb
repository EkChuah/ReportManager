class FormulairesController < ApplicationController
    def create
    
        if params[:categorie]["typeFiche"]=="Rapport"
            
            Fiche.create(Projet: params[:categorie]["Projet"],Eleve: params[:user]["id"],Commentaire: params[:categorie][:Commentaire],Travail: "0",Rapport: "1",Soutenance: "0")
            @fiche=Fiche.where("Projet = ? and Eleve = ? and Rapport = ?",params[:categorie]["Projet"],params[:user]["id"],1)
            @categories=Categorie.joins("INNER JOIN liaison_categorie_type_projets ON liaison_categorie_type_projets.CategorieID =categories.id").where("liaison_categorie_type_projets.TypeProjetID = ? and liaison_categorie_type_projets.Rapport = ?",params[:categorie]["typeProjet"],1)
            @project=Project.find(@fiche.first.Projet)
            @project.update({'StatutD': '2'})
        elsif params[:categorie]["typeFiche"]=="Travail"
            Fiche.create(Projet: params[:categorie]["Projet"],Eleve: params[:user]["id"],Commentaire: params[:categorie][:Commentaire],Travail: "1",Rapport: "0",Soutenance: "0")
            @fiche=Fiche.where("Projet = ? and Eleve = ? and Travail = ?",params[:categorie]["Projet"],params[:user]["id"],1)
            @categories=Categorie.joins("INNER JOIN liaison_categorie_type_projets ON liaison_categorie_type_projets.CategorieID =categories.id").where("liaison_categorie_type_projets.TypeProjetID = ? and liaison_categorie_type_projets.Travail = ?",params[:categorie]["typeProjet"],1)
            @project=Project.find(@fiche.first.Projet)
            
            @project.update({'StatutB': '2'})
        elsif params[:categorie]["typeFiche"]=="Soutenance"
            Fiche.create(Projet: params[:categorie]["Projet"],Eleve: params[:user]["id"],Commentaire: params[:categorie][:Commentaire],Travail: "0",Rapport: "0",Soutenance: "1")
            @categories=Categorie.joins("INNER JOIN liaison_categorie_type_projets ON liaison_categorie_type_projets.CategorieID =categories.id").where("liaison_categorie_type_projets.TypeProjetID = ? and liaison_categorie_type_projets.Soutenance = ?",params[:categorie]["typeProjet"],1)
            @fiche=Fiche.where("Projet = ? and Eleve = ? and Soutenance = ?",params[:categorie]["Projet"],params[:user]["id"],1)
            @project=Project.find(@fiche.first.Projet)
            @project.update({'StatutD': '4'})
        end
        
        @categories.each do |cat|
            NoteCategorie.create(Fiche: @fiche.first.id,Categorie: cat.id)
        end

        params[:categorie][:question].each do |key,value|
                next if key=="Note"
                @NoteCategorie=NoteCategorie.where("Fiche = ? and Categorie = ? ", @fiche.first.id , value["Categorie"])
                NoteQuestion.create(NoteCategorie: @NoteCategorie.first.id,Question: value["Question"],Note: value["Note"],Commentaire: value["Commentaire"])                        
        end

    end
end