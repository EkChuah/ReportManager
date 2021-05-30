class QuestionsController < ApplicationController
  def index
    @questions=Question.all 
  end

  def create
    @question = Question.new(question_params)
    respond_to do |format|
        format.html 
        format.js
      end
  @question.save
  end

  def edit 
      respond_to do |format|
        format.html
        format.js
       end
      @question = Question.find(params[:id])
    end

  def update 
      @question = Question.find(params[:id])
      respond_to do |format|
        if @question.update(question_params)
          format.html { redirect_to questions_path, notice: 'Question a bien été créée'}
          
        end
      end
    end

  def show
    @question=Question.find(params[:id])
  end

  def destroy 
      @question= Question.find(params[:id])
      @question.destroy
      redirect_to questions_path
    end

  private
      def question_params
        params.require(:question).permit(:Numero,:Categorie,:Intitule,:MaxNote)
      end

end
