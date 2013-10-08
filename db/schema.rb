# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130924165552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cursadas", id: false, force: true do |t|
    t.integer  "curso_id"
    t.integer  "estudiante_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cursadas", ["curso_id", "estudiante_id"], name: "index_cursadas_on_curso_id_and_estudiante_id", using: :btree

  create_table "cursos", force: true do |t|
    t.string   "nombre"
    t.integer  "creditos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estudiantes", force: true do |t|
    t.string   "nombre"
    t.string   "email"
    t.integer  "semestre_actual"
    t.integer  "programa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "estudiantes", ["email"], name: "index_estudiantes_on_email", unique: true, using: :btree
  add_index "estudiantes", ["remember_token"], name: "index_estudiantes_on_remember_token", using: :btree

  create_table "pensums", id: false, force: true do |t|
    t.integer  "curso_id"
    t.integer  "programa_id"
    t.integer  "semestre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pensums", ["curso_id", "programa_id"], name: "index_pensums_on_curso_id_and_programa_id", using: :btree

  create_table "plans", id: false, force: true do |t|
    t.integer  "curso_id"
    t.integer  "estudiante_id"
    t.integer  "semestre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plans", ["curso_id", "estudiante_id"], name: "index_plans_on_curso_id_and_estudiante_id", using: :btree

  create_table "programas", force: true do |t|
    t.string   "nombre"
    t.boolean  "es_maestria"
    t.integer  "duracion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "validas", id: false, force: true do |t|
    t.integer  "curso_id"
    t.integer  "programa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "validas", ["curso_id", "programa_id"], name: "index_validas_on_curso_id_and_programa_id", using: :btree

end
