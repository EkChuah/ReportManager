class LiaisonGroupeElevesController < ApplicationController
    before_action :require_admin
def new 
    @usersE = User.where("Eleve = ?", true)
    @groupes = Groupe.all
end

def create 
    respond_to do |format|
        format.html 
        format.js
       end
    @liaison= LiaisonGroupeEleve.new
    @liaison.GroupeID=params[:groupe][:id]
    @liaison.EleveID=params[:user][:id]
    @liaison.save
end 


end


