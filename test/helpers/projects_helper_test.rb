class ProjectsHelperTest < ActionView::TestCase
    test "should update StatutC to 0" do
        Groupe.create(Nom: 'groupe 1')
        User.create(Nom: 'Valjean',Prenom: 'Jean',email: 'Jean.valjean@gmail.com',password_digest: 'admin',Langue: 'Francais', Academique: '0', Industriel: '1', Eleve: '0', Admin: '0')
        TypeProjet.create(Nom:"Stage 1A",Responsable: "1",DureeSoutenanceExpose:"10",DureeSoutenanceQuestions:"10")
        
        Rapport.create()
        Project.create(Projet: '1', EncadrantAca: '1', EncadrantInd: '1', Groupe: '1',Rapport: "1", Titre: "Stage", Description: "Stage en entreprise", DateDebut: "12/12/2020", DateFin: "20/06/2020", DateRenduRapport: "25/06/2021", DateEvaluation: "25/06/2021")
        project=Project.find(1)
        rapport=Rapport.find(1)
        Statut_C(project,rapport)
        projectUpdated=Project.find(1)
        assert_equal(0,projectUpdated.StatutC)

        

    end

    test "should set RetardRendu to 1" do
        Groupe.create(Nom: 'groupe 1')
        User.create(Nom: 'Valjean',Prenom: 'Jean',email: 'Jean.valjean@gmail.com',password_digest: 'admin',Langue: 'Francais', Academique: '0', Industriel: '1', Eleve: '0', Admin: '0')
        TypeProjet.create(Nom:"Stage 1A",Responsable: "1",DureeSoutenanceExpose:"10",DureeSoutenanceQuestions:"10")
        
        Rapport.create()
        Project.create(Projet: '1', EncadrantAca: '1', EncadrantInd: '1', Groupe: '1',Rapport: "1", Titre: "Stage", Description: "Stage en entreprise", DateDebut: "12/12/2020", DateFin: "20/06/2020", DateRenduRapport: "25/06/2021", DateEvaluation: "25/06/2021", StatutC: "0")
        project=Project.find(1)
        rapport=Rapport.find(1)
        Statut_C(project,rapport)
        projectUpdated=Project.find(1)
        assert projectUpdated.RetardRendu

        

    end
    test "should update StatutD to 1" do
        Groupe.create(Nom: 'groupe 1')
        User.create(Nom: 'Valjean',Prenom: 'Jean',email: 'Jean.valjean@gmail.com',password_digest: 'admin',Langue: 'Francais', Academique: '0', Industriel: '1', Eleve: '0', Admin: '0')
        TypeProjet.create(Nom:"Stage 1A",Responsable: "1",DureeSoutenanceExpose:"10",DureeSoutenanceQuestions:"10")
        
        Rapport.create(Valide: "1")
        Project.create(Projet: '1', EncadrantAca: '1', EncadrantInd: '1', Groupe: '1',Rapport: "1", Titre: "Stage", Description: "Stage en entreprise", DateDebut: "12/12/2020", DateFin: "20/06/2020", DateRenduRapport: "25/06/2021", DateEvaluation: "25/06/2021", StatutC: "1")
        project=Project.find(1)
        rapport=Rapport.find(1)
        Statut_C(project,rapport)
        projectUpdated=Project.find(1)
        assert_equal(2,projectUpdated.StatutC)

        

    end

  end