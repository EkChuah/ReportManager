module ApplicationHelper

    def isAdmin?
        if current_user.Admin
            return true
        end
    end

    def isEleve?
        if current_user.Eleve
            return true
        end
    end
    def isAca?
        if current_user.Academique
            return true
        end
    end
    def isInd?
        if current_user.Industriel
            return true
        end
    end

    def isRespo?
        type=TypeProjet.where("Responsable = ?",current_user.id)
        unless type.empty?
            return true
        end
    end
end
