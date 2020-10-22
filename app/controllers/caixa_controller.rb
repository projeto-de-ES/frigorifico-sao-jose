class CaixaController < ApplicationController
    before_action :logado

    def logado
        unless Usuario.checar_usuario_logado
            redirect_to logins_path
        end
    end

    def abrir
        @caixa = Caixa.new
        if @caixa.algumCaixaAberto (params[:id])
            @caixa = @caixa.getCaixaAberto (params[:id])
            redirect_to root_url, notice: 'Ja existe um caixa aberto.'
        else
            @caixa = Caixa.new
        end
    end

    def fechar
        @caixa = Caixa.new
        if !@caixa.algumCaixaAberto (params[:id])
            redirect_to root_url, notice: 'Nao existe nenhum caixa aberto.'
        else
            @caixa = @caixa.getCaixaAberto (params[:id])
        end
    end

    def abrirCaixa
        @caixa = Caixa.new(caixa_params)
        @caixa = @caixa.abrirUmCaixa(@caixa,params[:id])

        respond_to do |format|
            if @caixa.save
                @caixa.valor_arrecadado = @caixa.valor_total - @caixa.valor_inicial
                @caixa.update(caixa_params)
                format.html { redirect_to root_url, notice: 'Caixa aberto com sucesso.' }
                format.json { render :show, status: :created, location: @caixa }
            else
                format.html { render :abrir }
                format.json { render json: @caixa.errors, status: :unprocessable_entity }
            end
        end
    end

    def fecharCaixa
        caixa = Caixa.new
        caixa = caixa.getCaixaAberto (params[:id])
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
