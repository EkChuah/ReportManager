# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_13_152649) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.integer "Numero"
    t.string "Intitule"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fiches", force: :cascade do |t|
    t.integer "Projet"
    t.integer "true"
    t.integer "Eleve"
    t.boolean "Travail"
    t.boolean "Rapport"
    t.boolean "Soutenance"
    t.string "Commentaire"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groupes", force: :cascade do |t|
    t.string "Nom"
    t.integer "PresidentDeJury"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "liaison_categorie_type_projets", force: :cascade do |t|
    t.integer "CategorieID"
    t.integer "TypeProjetID"
    t.boolean "Travail"
    t.boolean "Rapport"
    t.boolean "Soutenance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "liaison_groupe_eleves", force: :cascade do |t|
    t.integer "GroupeID"
    t.integer "EleveID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "liaison_juries", force: :cascade do |t|
    t.integer "Groupe"
    t.integer "MembreJury"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "note_categories", force: :cascade do |t|
    t.integer "Fiche"
    t.integer "Categorie"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "note_questions", force: :cascade do |t|
    t.integer "NoteCategorie"
    t.integer "Question"
    t.integer "Note"
    t.string "Commentaire"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer "Projet"
    t.integer "EncadrantAca"
    t.integer "EncadrantInd"
    t.integer "Groupe"
    t.integer "Rapport"
    t.string "Titre"
    t.string "Description"
    t.datetime "DateDebut"
    t.datetime "DateFin"
    t.integer "StatutA"
    t.integer "StatutB"
    t.integer "StatutC"
    t.integer "StatutD"
    t.integer "StatutE"
    t.integer "StatutF"
    t.integer "StatutG"
    t.datetime "DateRenduRapport"
    t.datetime "DateEvaluation"
    t.datetime "DateNotation"
    t.datetime "DateSoutenance"
    t.boolean "RetardRendu"
    t.datetime "DateNotationSoutenance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer "Numero"
    t.integer "Categorie"
    t.string "Intitule"
    t.integer "MaxNote"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rapports", force: :cascade do |t|
    t.boolean "Confidentiel"
    t.boolean "Note"
    t.boolean "Evalue"
    t.boolean "Valide"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_projets", force: :cascade do |t|
    t.string "Nom"
    t.integer "Responsable"
    t.integer "DureeSoutenanceExpose"
    t.integer "DureeSoutenanceQuestions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "Nom"
    t.string "Prenom"
    t.string "email"
    t.string "password_digest"
    t.string "Langue"
    t.boolean "Academique"
    t.boolean "Industriel"
    t.boolean "Eleve"
    t.boolean "Admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "fiches", "projects", column: "Projet"
  add_foreign_key "fiches", "users", column: "Eleve"
  add_foreign_key "groupes", "users", column: "PresidentDeJury"
  add_foreign_key "liaison_categorie_type_projets", "categories", column: "CategorieID"
  add_foreign_key "liaison_groupe_eleves", "groupes", column: "GroupeID"
  add_foreign_key "liaison_groupe_eleves", "users", column: "EleveID"
  add_foreign_key "liaison_juries", "groupes", column: "Groupe"
  add_foreign_key "liaison_juries", "users", column: "MembreJury"
  add_foreign_key "note_categories", "categories", column: "Categorie"
  add_foreign_key "note_categories", "fiches", column: "Fiche"
  add_foreign_key "note_questions", "note_categories", column: "NoteCategorie"
  add_foreign_key "note_questions", "questions", column: "Question"
  add_foreign_key "projects", "groupes", column: "Groupe"
  add_foreign_key "projects", "rapports", column: "Rapport"
  add_foreign_key "projects", "users", column: "EncadrantAca"
  add_foreign_key "projects", "users", column: "EncadrantInd"
  add_foreign_key "questions", "categories", column: "Categorie"
  add_foreign_key "type_projets", "users", column: "Responsable"
end
