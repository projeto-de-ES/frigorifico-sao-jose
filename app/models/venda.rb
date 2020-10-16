class Venda < ApplicationRecord
  has_many :produto_vendas
  has_many :produtos, through: :produto_vendas
end
