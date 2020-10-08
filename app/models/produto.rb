class Produto < ApplicationRecord
  attr_accessor
  validates :nome, presence: {message: "deve ser preenchido"}
  validates :categoria, presence: {message: "deve ser preenchido"}
  validates :qtd_estoque, presence: {message: "deve ser preenchido"}, numericality: true
  validates :preco, presence: {message: "deve ser preenchido"}, numericality: true
end
