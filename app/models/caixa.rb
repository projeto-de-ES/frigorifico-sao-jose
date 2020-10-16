class Caixa < ApplicationRecord
  belongs_to :usuario

  validates :valor_inicial, presence: {message: "deve ser preenchido"}
end
