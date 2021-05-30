module ProjectsHelper

    def can_modif_report(project)
        if project.DateRenduRapport > Time.now && current_user.Eleve
            return true
        end
    end

    def progressBar(project) 
        if project.StatutD == 5
            return 100
        elsif project.StatutD == 4
            return 84
        elsif project.StatutD == 3
            return 70
        elsif project.StatutD == 2
            return 56
        elsif project.StatutD == 1
            return 42
        elsif project.StatutC == 2 
            return 28
        elsif project.StatutA == 2
            return 14
        elsif project.StatutA == 1 
            return 0

        end

    end


    

    def can_see_report(project)
        if project.StatutC == 1  && current_user.Industriel 
            return true
        elsif project.StatutC == 1  && current_user.Eleve
            return true
        elsif project.StatutC == 2 && current_user.Academique
            return true
        
        end
    end


    def Statut_A(project,rapport)
        if project.StatutA.nil? 
            project.update({'StatutA': '0'})
        elsif project.StatutA == 0 && Time.now > project.DateDebut
            project.update({'StatutA': '1'})
        elsif project.StatutA == 1 && rapport.pdf.attached?
            project.update({'StatutA': '2'})
        end
    end

    def Statut_B(project)

        if project.StatutB.nil? && Time.now > project.DateDebut
            project.update({'StatutB': '0'})
        elsif project.StatutB == 0 && Time.now > project.DateFin
            project.update({'StatutB': '1'})
        end
    end

    def Statut_C(project,report)
        

        if Time.now > project.DateFin && project.StatutC.nil?
            project.update({'StatutC': '0'})
        elsif  project.StatutA != 2 && project.StatutC==0
            project.update({'RetardRendu': '1'})
        elsif project.StatutA ==2 && project.StatutC ==0
            project.update({'StatutC': '1'})
        end
        if report.Valide && project.StatutC == 1 
            project.update({'StatutC': '2'})
        end  

    end

    def reupload_report(project)
        if project.StatutC == 2
            project.update({'StatutC': '1'})
            return 1
        elsif project.StatutC == 3
            project.update({'StatutC': '1'})
        end
    end

    def Statut_E(project)
        if Time.now >project.DateFin && project.StatutE.nil?
            project.update({'StatutE': '0'})
        elsif !project.DateEvaluation.nil? && project.StatutE == 0
            if Time.now > project.DateEvaluation
                project.update({'StatutE': '1'})
            end
        elsif project.StatutE == 1 && project.StatutB == 2
            project.update({'StatutE': '2'})
        end
    end

    def Statut_D(project)

        if Time.now >project.DateFin && project.StatutD.nil?
            project.update({'StatutD': '0'})
        elsif project.StatutB == 2 && project.StatutC == 2 && project.StatutD == 0
            project.update({'StatutD': '1'})
        elsif  project.StatutD == 2 && !project.DateSoutenance.nil?
            if Time.now >project.DateSoutenance
                project.update({'StatutD': '3'})
            end
        
        
        end
    end

    def Statut_F(project)
        if project.StatutB == 2 && project.StatutF.nil?
            project.update({'StatutF': '0'})
        elsif project.StatutF == 0 &&  !project.DateNotation.nil?
            if Time.now>project.DateNotation
                project.update({'StatutF': '1'})
            end
        elsif project.StatutF == 1 && project.StatutD == 2
            project.update({'StatutF': '2'})
        end
    end

    def Statut_G(project)
        if project.StatutD == 3 && project.StatutG.nil?
            project.update({'StatutG': '0'})
        elsif project.StatutG == 0 &&  !project.DateNotationSoutenance.nil?
            if Time.now > project.DateNotationSoutenance
                project.update({'StatutG': '1'})
            end
        elsif project.StatutG == 1 && project.StatutD == 4
            project.update({'StatutG': '2'})
        
        end
    end

    
    



    def createList(question)
        choix=[[10,'10'],[9,'9'],[8,'8'],[7,'7'],[6,'6'],[5,'5'],[4,'4'],[3,'3'],[2,'2'],[1,'1'],[0,'0']]
        return choix[10-question.MaxNote,10]
    end

    def isResponsable(project)
        @type=TypeProjet.find(project.Projet)
        if current_user.Admin
            return true
        elsif @type.Responsable == current_user.id
            return true 
        end 
    end

    def isPresident(project)
        @groupe = Groupe.find(project.Groupe)
        if current_user.id == @groupe.PresidentDeJury
            return 1
        end
    end

    
end
