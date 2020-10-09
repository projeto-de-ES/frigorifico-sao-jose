class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]
  before_action :logado

  def logado
    if !Usuario.checar_usuario_logado
      redirect_to logins_path
    end
  end

  # GET /produtos
  # GET /produtos.json
  def index
    if params[:nome]
      @produtos = Produto.where("nome like ?","%#{params[:nome]}%")
    else
      @produtos = Produto.all
    end
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
  end

  # GET /produtos/1/edit
  def edit
  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(produto_params)

    respond_to do |format|
      if @produto.save
        format.html { redirect_to produtos_path, notice: 'Produto criado com sucesso.' }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produtos/1
  # PATCH/PUT /produtos/1.json
  def update

    respond_to do |format|
      if @produto.update(produto_params)
        format.html { redirect_to produtos_path, notice: 'Produto editado com sucesso.' }
        format.json { render :show, status: :ok, location: @produto }
      else
        format.html { render :edit }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto.destroy
    respond_to do |format|
      format.html { redirect_to produtos_url, notice: 'Produto deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  def recebimento
    @produto = Produto.find(params[:id])
  end

  def recebimentoAtualiza
    @produto = Produto.find(params[:id])
    if Produto.update(@produto.id, :qtd_estoque => @produto[:qtd_estoque].to_f + params[:recebimento].to_f)
      redirect_to produtos_path, notice: 'Recebimento de produto efetuado com sucesso.'
    else
      render recebimento_produto_path
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def produto_params
      params.require(:produto).permit(:nome, :categoria, :qtd_estoque, :preco)
    end
end

