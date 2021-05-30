require 'test_helper'

class TypeProjetsTest < ActiveSupport::TestCase

  

  test "should not save empty type projet" do
    typeProjet = TypeProjet.new
    assert_not typeProjet.save
  end


  test " should save type projet with correct input" do 
    User.create(Nom: 'Valjean',Prenom: 'Jean',email: 'Jean.valjean@gmail.com',password_digest: 'admin',Langue: 'Francais', Academique: '0', Industriel: '1', Eleve: '0', Admin: '0')

    typeProjet= TypeProjet.new(Nom:"Stage 1A",Responsable: "1",DureeSoutenanceExpose:"10",DureeSoutenanceQuestions:"10")
    assert typeProjet.save
  end 


  end
