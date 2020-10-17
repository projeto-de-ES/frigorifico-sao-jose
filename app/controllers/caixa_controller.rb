class CaixaController < ApplicationController
    before_action :logado

    def logado
        unless Usuario.checar_usuario_logado
            redirect_to logins_path
        end
    end

    def abrir
        caixa = Caixa.where(usuario_id: params[:id]).where(aberto: true).where(data: Time.current).take
        if caixa.present?
            @caixa = caixa
            redirect_to root_url, notice: 'Já existe um caixa aberto.'
        else
            @caixa = Caixa.new
        end
    end

    def fechar
        caixa = Caixa.where(usuario_id: params[:id]).where(aberto: true).where(data: Time.current).take
        if !caixa.present?
            redirect_to root_url, notice: 'Não existe nenhum caixa aberto.'
        else
            @caixa = caixa
        end
    end

    def abrirCaixa
        @caixa = Caixa.new(caixa_params)
        @caixa.usuario_id = Usuario.find(params[:id]).id
        @caixa.data = Time.current
        @caixa.aberto = true

        respond_to do |format|
            if @caixa.save
                format.html { redirect_to root_url, notice: 'Caixa aberto com sucesso.' }
                format.json { render :show, status: :created, location: @caixa }
            else
                format.html { render :abrir }
                format.json { render json: @caixa.errors, status: :unprocessable_entity }
            end
        end
    end

    def fecharCaixa
        caixa = Caixa.where(usuario_id: params[:id]).where(aberto: true).where(data: Time.current).take
        # puts(Date.current)
        respond_to do |format|
            if caixa.data != Date.current
                format.html { redirect_to root_url, notice: 'Um caixa de dia diferente não pode ser fechado.' }
                format.json { render :show, status: :created, location: caixa }
            elsif caixa.update(caixa_params)
                caixa.valor_arrecadado = caixa.valor_total - caixa.valor_inicial
                caixa.aberto = false
                caixa.update(caixa_params)
                format.html { redirect_to root_url, notice: 'Caixa fechado com sucesso.' }
                format.json { render :show, status: :created, location: caixa }
            else
                format.html { render :fechar }
                format.json { render json: caixa.errors, status: :unprocessable_entity }
            end
        end
    end

    private
    def caixa_params
        params.require(:caixa).permit(:valor_inicial, :valor_total, :valor_arrecadado)
    end
end
