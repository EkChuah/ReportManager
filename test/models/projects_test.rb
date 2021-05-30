require 'test_helper'

class ProjectsTest < ActiveSupport::TestCase

  

  test "should not save empty project" do
    project = Project.new
    assert_not project.save
  end


  test " should save project with correct input" do 
    Groupe.create(Nom: 'groupe 1')
    User.create(Nom: 'Valjean',Prenom: 'Jean',email: 'Jean.valjean@gmail.com',password_digest: 'admin',Langue: 'Francais', Academique: '0', Industriel: '1', Eleve: '0', Admin: '0')
    TypeProjet.create(Nom:"Stage 1A",Responsable: "1",DureeSoutenanceExpose:"10",DureeSoutenanceQuestions:"10")
    
    project= Project.new(Projet: '1', EncadrantAca: '1', EncadrantInd: '1', Groupe: '1', Titre: "Stage", Description: "Stage en entreprise", DateDebut: "12/12/2020", DateFin: "20/06/2021", DateRenduRapport: "25/06/2021", DateEvaluation: "25/06/2021")
    assert project.save
  end 


  end
