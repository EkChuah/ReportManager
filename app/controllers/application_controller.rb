class ApplicationController < ActionController::Base

    helper ApplicationHelper
    helper_method :current_user
    include ProjectsHelper  
    
    
    def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end

  end
  
  def require_admin 
    unless current_user.Admin 
      flash[:error] = " Vous n'avez pas les autorisation nécessaires"
      redirect_to root_path
    end
  end
  

  def isAdmin?
   current_user.Admin
  end
    
end
