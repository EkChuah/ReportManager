class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.integer :Numero
      t.integer :Categorie
      t.string :Intitule
      t.integer :MaxNote

      t.timestamps
    end
  end
end
