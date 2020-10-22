class Caixa < ApplicationRecord
  belongs_to :usuario

  validates :valor_inicial, presence: {message: "deve ser preenchido"}

  def algumCaixaAberto (usuario_id)
    caixa = getCaixaAberto (usuario_id)
    if caixa.present?
      true
    else
      false
    end
  end

  def getCaixaAberto (usuario_id)
    Caixa.where(usuario_id: usuario_id).where(aberto: true).where(data: Time.current).take
  end
end
