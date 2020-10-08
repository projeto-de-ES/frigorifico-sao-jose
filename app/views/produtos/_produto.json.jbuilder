json.extract! produto, :id, :nome, :categoria, :qtd_estoque, :preco, :created_at, :updated_at
json.url produto_url(produto, format: :json)
