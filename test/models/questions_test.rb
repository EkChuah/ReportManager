require 'test_helper'

class QuestionsTest < ActiveSupport::TestCase

  

  test "should not save empty question" do
    question = Question.new
    assert_not question.save
  end


  test " should save question with correct input" do 
    Categorie.create(Numero: "1",Intitule: "Categorie 1")
    question= Question.new(Numero: "1",Categorie: "1", Intitule: "1", MaxNote: "5")
    assert question.save
  end 


  end
