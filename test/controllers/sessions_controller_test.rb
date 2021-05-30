require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test " login as admin" do 
    user= User.new(Nom: 'Valjean',Prenom: 'Jean',email: 'Jean.valjean@gmail.com',password_digest: BCrypt::Password.create('admin'),Langue: 'Francais', Academique: '0', Industriel: '0', Eleve: '0', Admin: '1')
    post sessions_path(user)
    assert_response :success

  end 

  test " login as encadrant academique" do 
    user= User.new(Nom: 'Valjean',Prenom: 'Jean',email: 'Jean.valjean@gmail.com',password_digest: BCrypt::Password.create('admin'),Langue: 'Francais', Academique: '1', Industriel: '0', Eleve: '0', Admin: '0')
    post sessions_path(user)
    assert_response :success

  end 

  test " login as encadrant industriel" do 
    user= User.new(Nom: 'Valjean',Prenom: 'Jean',email: 'Jean.valjean@gmail.com',password_digest: BCrypt::Password.create('admin'),Langue: 'Francais', Academique: '0', Industriel: '1', Eleve: '0', Admin: '0')
    post sessions_path(user)
    assert_response :success

  end 

  test " login as eleve" do 
    user= User.new(Nom: 'Valjean',Prenom: 'Jean',email: 'Jean.valjean@gmail.com',password_digest: BCrypt::Password.create('admin'),Langue: 'Francais', Academique: '0', Industriel: '0', Eleve: '1', Admin: '0')
    post sessions_path(user)
    assert_response :success

  end 

  


end

