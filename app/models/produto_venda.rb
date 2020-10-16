class ProdutoVenda < ApplicationRecord
  belongs_to :produto
  belongs_to :venda
  validates :produto_id, presence: {message: 'deve ser preenchido.'}
  validates :qtd_produtos, numericality: true, presence: {message: 'deve ser preenchido.'}
end
