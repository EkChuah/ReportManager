class GroupesController < ApplicationController
  #before_action :require_admin

  def index
    @groupes=Groupe.all
    @usersA = User.where("Academique = ?", true)
  end

  def new
    @usersA = User.where("Academique = ?", true)
    @usersE = User.where("Eleve = ?", true)
  end

  def show 
    @groupe = Groupe.find(params[:id])
  end 

  def create
   
    @groupe = Groupe.new(groupe_params)
      respond_to do |format|
        format.html 
        format.js
      end
      @groupe.PresidentDeJury=params[:user]["id"]
      @groupe.save
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
    @usersA = User.where("Academique = ?", true)
    @users = User.where("Eleve = ?", true)
    @groupe = Groupe.find(params[:id])
  end
 

  def update
    @groupe = Groupe.find(params[:id])
    puts @groupe.Nom
      respond_to do |format|
        if @groupe.update(groupe_params)
          format.html
          format.js
        end
      end
    @groupe.PresidentDeJury=params[:user]["id"]
    @groupe.save   
  end

    def destroy 
      @groupe= Groupe.find(params[:id])
      @groupe.destroy
      redirect_to groupes_path
    end

  private 

  def groupe_params
    params.permit(:Nom,:PresidentDeJury)
  end
end
