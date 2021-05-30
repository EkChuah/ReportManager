class CreateGroupes < ActiveRecord::Migration[6.0]
  def change
    create_table :groupes do |t|
      t.string :Nom
      t.integer :PresidentDeJury

      t.timestamps
    end
  end
end
