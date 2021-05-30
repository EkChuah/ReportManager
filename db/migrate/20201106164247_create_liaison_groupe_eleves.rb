class CreateLiaisonGroupeEleves < ActiveRecord::Migration[6.0]
  def change
    create_table :liaison_groupe_eleves do |t|
      t.integer :GroupeID
      t.integer :EleveID

      t.timestamps
    end
  end
end
