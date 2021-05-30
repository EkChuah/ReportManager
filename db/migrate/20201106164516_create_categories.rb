class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.integer :Numero
      t.string :Intitule

      t.timestamps
    end
  end
end
