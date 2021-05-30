class RapportsController < ApplicationController
    helper ProjectsHelper


def create 
    @rapport=Rapport.new(rapport_params)
end

def edit 
    @rapport=Rapport.find(params[:id])
   
end

def update 

    @project=Project.where("Rapport = ?",params["id"])
    
    @rapport=Rapport.find(params[:id])
    if helpers.reupload_report(@project.first)

        @rapport.update({'Valide': '0'})
    else 
        @rapport.update(rapport_params)

        if params[:rapport]["Valide"] == 1
            @project.update({'StatutC': '2'})
        elsif params[:rapport]["Valide"] == 0
            @project.update({'StatutC': '3'})
        end
    end


end


private

def rapport_params
    params.require(:rapport).permit(:Confidentiel,:Note,:Evalue,:Valide,:pdf, :confi)
  end
end
