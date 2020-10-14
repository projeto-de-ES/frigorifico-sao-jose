class CreateProdutoVendas < ActiveRecord::Migration[6.0]
  def change
    create_table :produto_vendas do |t|
      t.references :produto, null: false, foreign_key: true
      t.references :venda, null: false, foreign_key: true
      t.float :qtd_produtos
      t.float :valor

      t.timestamps
    end
  end
end
