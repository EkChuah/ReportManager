class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :Nom
      t.string :Prenom
      t.string :email
      t.string :password_digest
      t.string :Langue
      t.boolean :Academique
      t.boolean :Industriel
      t.boolean :Eleve
      t.boolean :Admin
      t.timestamps
    end
  end
end
