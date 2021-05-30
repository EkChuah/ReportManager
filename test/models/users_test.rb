require 'test_helper'

class UsersTest < ActiveSupport::TestCase

  

  test "should not save empty user" do
    user = User.new
    assert_not user.save
  end

  test " should not save user with a wrong mail form" do
    user= User.new(Nom: 'Valjean',Prenom: 'Jean',email: 'Jean.valjean',password_digest: 'admin',Langue: 'Francais', Academique: '0', Industriel: '1', Eleve: '0', Admin: '0')
    assert_not user.save 
  end

  test " should save user with correct input" do 
    user= User.new(Nom: 'Valjean',Prenom: 'Jean',email: 'Jean.valjean@gmail.com',password_digest: 'admin',Langue: 'Francais', Academique: '0', Industriel: '1', Eleve: '0', Admin: '0')
    assert user.save
  end 


  end
