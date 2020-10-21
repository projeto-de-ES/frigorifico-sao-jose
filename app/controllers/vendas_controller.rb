class VendasController < ApplicationController
  before_action :set_venda, only: [:show, :edit, :update, :destroy]
  before_action :logado

  def logado
    unless Usuario.checar_usuario_logado
      redirect_to logins_path
    end
  end

  # GET /vendas
  # GET /vendas.json
  def index
    @vendas = Venda.all
  end

  # GET /vendas/1
  # GET /vendas/1.json
  def show
  end

  # GET /vendas/new
  def new
    caixa = Caixa.where(usuario_id: Usuario.get_usuario.id).where(aberto: true).where(data: Time.current).take
    unless caixa.present?
      redirect_to root_url, notice: 'Nenhum caixa aberto, para efetuar uma venda abra o caixa.'
    else
      @venda = Venda.new
    end
  end

  # GET /vendas/1/edit
  def edit
  end

  # POST /vendas
  # POST /vendas.json
  def create
    @venda = Venda.new(venda_params)

    respond_to do |format|
      if @venda.save
        format.html { redirect_to @venda }
        format.json { render :show, status: :created, location: @venda }
      else
        format.html { render :new }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendas/1
  # PATCH/PUT /vendas/1.json
  def update
    respond_to do |format|
      if @venda.update(venda_params)
        format.html { redirect_to @venda, notice: 'Venda atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @venda }
      else
        format.html { render :edit }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendas/1
  # DELETE /vendas/1.json
  def destroy
    for produto_venda in @venda.produto_vendas
      produto_venda.destroy
    end
    @venda.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Venda cancelada com sucesso.' }
      format.json { head :no_content }
    end
  end

  def finalizarVenda
    @venda = Venda.find(params[:id])

    caixa = Caixa.where(usuario_id: Usuario.get_usuario.id).where(aberto: true).where(data: Time.current).take
    caixa.valor_total = caixa.valor_total + @venda.valor 
    caixa.valor_arrecadado = caixa.valor_total - caixa.valor_inicial
    caixa.update({:valor_inicial => caixa.valor_inicial, :valor_total => caixa.valor_total, :valor_arrecadado => caixa.valor_arrecadado})

    @venda.produto_vendas.each do |produto_venda|
      Produto.update(produto_venda.produto_id, :qtd_estoque => produto_venda.produto.qtd_estoque - produto_venda[:qtd_produtos].to_f)
    end
    redirect_to root_path, notice: "Venda finalizada com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venda
      @venda = Venda.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def venda_params
      params.require(:venda).permit(:valor)
    end
end
