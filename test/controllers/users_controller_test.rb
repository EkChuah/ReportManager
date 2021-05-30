class UsersControllerTest < ActionDispatch::IntegrationTest
  
    test "should  update user with admin permission" do
        user= User.new(Nom: 'Valjean',Prenom: 'Jean',email: 'Jean.valjean@gmail.com',password_digest: BCrypt::Password.create('admin'),Langue: 'Francais', Academique: '0', Industriel: '0', Eleve: '0', Admin: '1')
        post sessions_path(user)
        User.create(Nom: 'Valjean',Prenom: 'Jean',email: 'Jean.valjean',password_digest: 'admin',Langue: 'Francais', Academique: '0', Industriel: '1', Eleve: '0', Admin: '0')
        user=User.where("Nom = ?","Valjean")
        
      
        assert  edit_user_path(user), params: { Nom: "Updated" }

        
      
       
      end
    
      test "should delete user with admin permission" do 
        user= User.new(Nom: 'Valjean',Prenom: 'Jean',email: 'Jean.valjean@gmail.com',password_digest: BCrypt::Password.create('admin'),Langue: 'Francais', Academique: '0', Industriel: '0', Eleve: '0', Admin: '1')
        post sessions_path(user)
        User.create(Nom: 'Valjean',Prenom: 'Jean',email: 'Jean.valjean',password_digest: 'admin',Langue: 'Francais', Academique: '0', Industriel: '1', Eleve: '0', Admin: '0')
        user=User.where("Nom = ?","Valjean")
    
        assert user_path(user), method: :delete
    
      end

      test "should get index" do
      
        get users_url
    
        assert_equal "index", @controller.action_name
        
      end
end