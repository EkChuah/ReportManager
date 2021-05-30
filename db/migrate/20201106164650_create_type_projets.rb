class CreateTypeProjets < ActiveRecord::Migration[6.0]
  def change
    create_table :type_projets do |t|
      t.string :Nom
      t.integer :Responsable
      t.integer :DureeSoutenanceExpose
      t.integer :DureeSoutenanceQuestions

      t.timestamps
    end
  end
end
