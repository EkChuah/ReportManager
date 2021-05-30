require 'test_helper'

class CategoriesTest < ActiveSupport::TestCase

  

  test "should not save empty categorie" do
    categorie = Categorie.new
    assert_not categorie.save
  end


  test " should save categorie with correct input" do 
    categorie= Categorie.new(Numero: "1",Intitule: "Categorie 1")
    assert categorie.save
  end 


  end
