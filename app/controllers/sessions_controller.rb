class SessionsController < ApplicationController
  def new
  end  

  

  def create
    
     user = User.find_by_email(params[:email])
     if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      if user.Admin
        redirect_to index_path, notice: "Logged in!"
      end
      if user.Eleve
        redirect_to index_path, notice: "Logged in!"
      end
      if user.Academique
        redirect_to index_path
      end
      if user.Industriel
        redirect_to index_path
      end
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end  
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
