class CreateCaixas < ActiveRecord::Migration[6.0]
  def change
    create_table :caixas do |t|
      t.date :data
      t.float :valor_inicial
      t.float :valor_total, null: true
      t.float :valor_arrecadado, null: true
      t.boolean :aberto
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
