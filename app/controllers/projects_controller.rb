class ProjectsController < ApplicationController
  #before_action :require_admin

  helper ProjectsHelper
  def index
    @projects = Project.all
  end
    def new
    @usersA = User.where("Academique = ?", true)
    @usersI = User.where("Industriel = ?", true)
    @groupes = Groupe.all
         
    end

    def update 
      @project=Project.find(params["id"])
      
      if !params[:project]["DateSoutenance"].nil?
          @project.DateSoutenance = params[:project]["DateSoutenance"]
      end
      if !params[:project]["DateNotationSoutenance"].nil?
        @project.DateNotationSoutenance = params[:project]["DateNotationSoutenance"]
      end
      if params[:project]["StatutD"] == '1'
        
        @project.StatutD = 5
      end
      @project.save 
    end

    def edit 
      @usersA = User.where("Academique = ?", true)
      @usersI = User.where("Industriel = ?", true)
      @groupes = Groupe.all
      
      respond_to do |format|
        format.html
        format.js
       end
      @project = Project.find(params[:id])
    end

    def show 
      @project=Project.find(params[:id])
      @typeProjet=TypeProjet.find(@project.Projet)
      @groupe=Groupe.find(@project.Groupe)
      @users=LiaisonGroupeElefe.where("GroupeID = ?",@project.Groupe)
      @respo=User.find(@typeProjet.Responsable)
      @encadrantA=User.find(@project.EncadrantAca)
      @encadrantI=User.find(@project.EncadrantInd)
      @rapport= Rapport.find(@project.Rapport)
      helpers.Statut_A(@project,@rapport)  
    end

    def infos
      @project=Project.find(params[:id])
      @typeProjet=TypeProjet.find(@project.Projet)
      @groupe=Groupe.find(@project.Groupe)
      @users=LiaisonGroupeElefe.where("GroupeID = ?",@project.Groupe)
      @respo=User.find(@typeProjet.Responsable)
      @encadrantA=User.find(@project.EncadrantAca)
      @encadrantI=User.find(@project.EncadrantInd)
      @rapport= Rapport.find(@project.Rapport)
      
      respond_to do |format|
        format.html 
        format.js
       end
    end

    def notationA 
      

      @project=Project.find(params[:id])
      @typeProjet=TypeProjet.find(@project.Projet)
      @groupe=Groupe.find(@project.Groupe)
      @eleves=@groupe.users
      @users=LiaisonGroupeElefe.where("GroupeID = ?",@project.Groupe)
      
      @categories=Categorie.joins("INNER JOIN liaison_categorie_type_projets ON liaison_categorie_type_projets.CategorieID =categories.id").where("liaison_categorie_type_projets.TypeProjetID = ? and liaison_categorie_type_projets.Rapport = ?",@typeProjet.id,1)
      
      respond_to do |format|
        format.html 
        format.js
       end
    end 

    def notationI 
      @project=Project.find(params[:id])
      @typeProjet=TypeProjet.find(@project.Projet)
      @groupe=Groupe.find(@project.Groupe)
      @eleves=@groupe.users
      @users=LiaisonGroupeElefe.where("GroupeID = ?",@project.Groupe)
      @categories=Categorie.joins("INNER JOIN liaison_categorie_type_projets ON liaison_categorie_type_projets.CategorieID =categories.id").where("liaison_categorie_type_projets.TypeProjetID = ? and liaison_categorie_type_projets.Travail = ?",@typeProjet.id,1)
      
      helpers.Statut_B(@project)
      respond_to do |format|
        format.html 
        format.js
       end
    end

    def soutenance
      @project=Project.find(params[:id])
      @typeProjet=TypeProjet.find(@project.Projet)
      @groupe=Groupe.find(@project.Groupe)
      @eleves=@groupe.users
      @users=LiaisonGroupeElefe.where("GroupeID = ?",@project.Groupe)
      @categories=Categorie.joins("INNER JOIN liaison_categorie_type_projets ON liaison_categorie_type_projets.CategorieID =categories.id").where("liaison_categorie_type_projets.TypeProjetID = ? and liaison_categorie_type_projets.Soutenance = ?",@typeProjet.id,1)
    
      respond_to do |format|
        format.html 
        format.js
       end
    end

    def infos_soutenance
      @project=Project.find(params[:id])
      @typeProjet=TypeProjet.find(@project.Projet)
      @groupe=Groupe.find(@project.Groupe)
      @idMembreJuries=LiaisonJury.where("Groupe = ?", @project.Groupe)
      @respo=User.find(@typeProjet.Responsable)
      @rapport= Rapport.find(@project.Rapport)
      
      @users= User.where("Academique = ?",1)
      
      respond_to do |format|
        format.html 
        format.js
       end
      
    end

    def create

      @project = Project.new(project_params)
      respond_to do |format|
        format.html 
        format.js
       end
      @project.EncadrantInd = params[:userA]["id"]
      @project.EncadrantAca = params[:userI]["id"]
      @project.Groupe = params[:groupe]["id"]
      @rapport=Rapport.new
      @rapport.Confidentiel = params["Confidentiel"]
      @rapport.save
      @project.Rapport=@rapport.id
      @project.save 
      Statut_A(@project,@rapport)

    end

    private
      def project_params
        params.require(:project).permit(:Projet,:EncadrantAca,:EncadrantInd,:Groupe,:Titre,:Description,:DateDebut,:DateFin,:DateRenduRapport,:DateNotation,:DateSoutenance,:DateEvaluation,:DateNotationSoutenance,:Rapport)
      end
end