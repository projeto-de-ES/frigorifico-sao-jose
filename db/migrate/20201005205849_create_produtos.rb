class CreateProdutos < ActiveRecord::Migration[6.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :categoria
      t.numeric :qtd_estoque
      t.float :preco

      t.timestamps
    end
  end
end
