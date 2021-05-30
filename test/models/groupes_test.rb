require 'test_helper'

class GroupesTest < ActiveSupport::TestCase

  

  test "should not save empty groupe" do
    groupe = Groupe.new
    assert_not groupe.save
  end

  test " should save groupe with correct input" do 
    groupe= Groupe.new(Nom: 'groupe 1')
    assert groupe.save
  end 


  end
