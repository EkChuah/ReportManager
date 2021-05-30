class CategoriesController < ApplicationController
  def index
    @categories.all
  end

def create
      @categorie = Categorie.new(categorie_params)
      respond_to do |format|
        format.html 
        format.js
       end
       @categorie.save
      
      
    end

    def show 
      @categorie = Categorie.find(params[:id])
    end 

    def index
      @categories = Categorie.all
    end

    def update 
      @categorie = Categorie.find(params[:id])
      respond_to do |format|
        if @categorie.update(categorie_params)
          format.html { redirect_to categories_path, notice: 'Categorie a bien été créée'}
          
        end
      end
    end

    def edit 
      respond_to do |format|
        format.html
        format.js
       end
      @categorie = Categorie.find(params[:id])
    end

    def destroy 
      @categorie= Categorie.find(params[:id])
      @categorie.destroy
      redirect_to categories_path
    end

    private
      def categorie_params
        params.require(:categorie).permit(:Numero,:Intitule)
      end

end
