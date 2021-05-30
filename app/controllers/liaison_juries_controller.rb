class LiaisonJuriesController < ApplicationController
  #before_action :require_admin
  
  def index
    @liaison_juries = LiaisonJury.all
    @groupes = Groupe.all
    @users = User.where("Academique = ?", true)   
  end

  def new
    @users = User.where("Academique = ?", true)
    @groupes = Groupe.all
  end

  def show 
      @liaison_jury = LiaisonJury.find(params[:id])
    end 

  def create
      @liaison_jury = LiaisonJury.new()
      respond_to do |format|
        format.html 
        format.js
       end
       @groupe=Groupe.find(params[:liaison_jury]["Groupe"])
       @liaison_jury.Groupe = @groupe.id
       @liaison_jury.MembreJury = params[:user]["id"]
       @liaison_jury.save
  end

  def update
      @groupes = Groupe.all
      @liaison_jury = LiaisonJury.find(params[:id])
      @users = User.where("Academique = ?", true)
      respond_to do |format|
        format.html
        format.js
        end
    end

  def show 
      @liaison_jury = LiaisonJury.find(params[:id])
  end 

    def edit 
      @liaison_jury = LiaisonJury.find(params[:id])
      puts @liaison_jury
      @users = User.where("Academique = ?", true)
      @groupes = Groupe.all
      respond_to do |format|
        format.html
        format.js
       end
      @liaison_juries = LiaisonJury.find(params[:id])
    end

  private
      def liaison_jury_params
        params.require(:liaison_jury).permit(:Groupe,:MembreJury)
      end

end
