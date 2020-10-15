class ProdutoVendasController < ApplicationController
  before_action :get_venda
  before_action :set_produto_venda, only: [:show, :edit, :update, :destroy]

  # GET /produto_vendas
  # GET /produto_vendas.json
  def index
    @produto_vendas = @venda.produto_vendas
  end

  # GET /produto_vendas/1
  # GET /produto_vendas/1.json
  def show
  end

  # GET /produto_vendas/new
  def new
    @produto_venda = @venda.produto_vendas.build
  end

  # GET /produto_vendas/1/edit
  def edit
  end

  # POST /produto_vendas
  # POST /produto_vendas.json
  def create
    @produto_venda = @venda.produto_vendas.build(produto_venda_params)

    respond_to do |format|
      if @produto_venda.save
        format.html { redirect_to @venda, notice: 'Produto adicionado com sucesso.' }
        format.json { render :show, status: :created, location: @produto_venda }
      else
        format.html { render :new }
        format.json { render json: @produto_venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produto_vendas/1
  # PATCH/PUT /produto_vendas/1.json
  def update
    respond_to do |format|
      if @produto_venda.update(produto_venda_params)
        format.html { redirect_to @venda, notice: 'Produto editado com sucesso.' }
        format.json { render :show, status: :ok, location: @produto_venda }
      else
        format.html { render :edit }
        format.json { render json: @produto_venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produto_vendas/1
  # DELETE /produto_vendas/1.json
  def destroy
    @produto_venda.destroy
    respond_to do |format|
      format.html { redirect_to @venda, notice: 'Produto removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto_venda
      @produto_venda = @venda.produto_vendas.where("id = ?", params[:id]).first
    end

    # Only allow a list of trusted parameters through.
    def produto_venda_params
      params.require(:produto_venda).permit(:produto_id, :venda_id, :qtd_produtos, :valor)
    end

  def get_venda
    @venda = Venda.find(params[:venda_id])
  end

end
