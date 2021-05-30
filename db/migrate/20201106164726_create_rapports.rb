class CreateRapports < ActiveRecord::Migration[6.0]
  def change
    create_table :rapports do |t|
      t.boolean :Confidentiel
      t.boolean :Note
      t.boolean :Evalue
      t.boolean :Valide

      t.timestamps
    end
  end
end
