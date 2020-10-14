json.extract! produto_venda, :id, :produto_id, :venda_id, :qtd_produtos, :valor, :created_at, :updated_at
json.url produto_venda_url(produto_venda, format: :json)
