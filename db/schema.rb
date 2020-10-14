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

ActiveRecord::Schema.define(version: 2020_10_14_152510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "produto_vendas", force: :cascade do |t|
    t.bigint "produto_id", null: false
    t.bigint "venda_id", null: false
    t.float "qtd_produtos"
    t.float "valor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["produto_id"], name: "index_produto_vendas_on_produto_id"
    t.index ["venda_id"], name: "index_produto_vendas_on_venda_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.string "categoria"
    t.decimal "qtd_estoque"
    t.float "preco"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "login"
    t.string "senha"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendas", force: :cascade do |t|
    t.float "valor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "produto_vendas", "produtos"
  add_foreign_key "produto_vendas", "vendas"
end
