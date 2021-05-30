require 'test_helper'

class FichesTest < ActiveSupport::TestCase

  

  test "should not save empty fiche" do
    fiche = Fiche.new
    assert_not fiche.save
  end


  


  end
