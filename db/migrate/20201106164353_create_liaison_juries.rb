class CreateLiaisonJuries < ActiveRecord::Migration[6.0]
  def change
    create_table :liaison_juries do |t|
      t.integer :Groupe
      t.integer :MembreJury

      t.timestamps
    end
  end
end
