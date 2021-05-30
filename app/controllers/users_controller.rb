class UsersController < ApplicationController
  before_action :require_admin

    def new
         
    end

    def create
      @user = User.new(user_params)
      respond_to do |format|
        format.html 
        format.js
      end
      @user.save
      
      
    end

    def show 
      @user = User.find(params[:id])
    end 

    def index
      @users = User.all
    end

    def update 
      @user = User.find(params[:id])
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to users_path, notice: 'User a bien été créée'}
          
        end
      end
    end

    def edit 
      respond_to do |format|
        format.html
        format.js
       end
      @user = User.find(params[:id])
    end

    def destroy 
      @user= User.find(params[:id])
      @user.destroy
      redirect_to users_path
    end

    private
    
      def user_params
        params.require(:user).permit(:Nom,:Prenom,:email,:password_digest,:Langue,:Academique,:Industriel,:Eleve,:Admin)
      end
    
    
end
