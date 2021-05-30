class TypeProjetsController < ApplicationController
  before_action :require_admin

    def new
      @users=User.where("Academique = ?", true)
    end

    def create
      @type_projet = TypeProjet.new(type_params)
      respond_to do |format|
        format.html 
        format.js
       end
       @type_projet.Responsable=params[:user][:id]
       @type_projet.save     
    end

    def show 
      @type_projet = TypeProjet.find(params[:id])
    end 

    def index
      @type_projets = TypeProjet.all   
    end

    def update 
      @type_projet = TypeProjet.find(params[:id])
      
      respond_to do |format|
        if @type_projet.update(type_params)
          format.html { redirect_to type_projets_path, notice: 'User a bien été créée'}
        end
      end
      @type_projet.Responsable=params[:user][:id]
      @type_projet.save
    end

    def edit 
      respond_to do |format|
        format.html
        format.js
      end
      @users=User.where("Academique = ?", true)
      @type_projet = TypeProjet.find(params[:id])
    end

    def destroy 
      @type_projet= TypeProjet.find(params[:id])
      @type_projet.destroy
      redirect_to type_projets_path
    end

    

    private
      def type_params
        params.require(:type_projet).permit(:Nom,:Responsable,:DureeSoutenanceExpose,:DureeSoutenanceQuestions)
      end
end
