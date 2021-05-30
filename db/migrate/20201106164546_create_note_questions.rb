class CreateNoteQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :note_questions do |t|
      t.integer :NoteCategorie
      t.integer :Question
      t.integer :Note
      t.string :Commentaire

      t.timestamps
    end
  end
end
