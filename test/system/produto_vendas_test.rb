require "application_system_test_case"

class ProdutoVendasTest < ApplicationSystemTestCase
  setup do
    @produto_venda = produto_vendas(:one)
  end

  test "visiting the index" do
    visit produto_vendas_url
    assert_selector "h1", text: "Produto Vendas"
  end

  test "creating a Produto venda" do
    visit produto_vendas_url
    click_on "New Produto Venda"

    fill_in "Produto", with: @produto_venda.produto_id
    fill_in "Qtd produtos", with: @produto_venda.qtd_produtos
    fill_in "Valor", with: @produto_venda.valor
    fill_in "Venda", with: @produto_venda.venda_id
    click_on "Create Produto venda"

    assert_text "Produto venda was successfully created"
    click_on "Back"
  end

  test "updating a Produto venda" do
    visit produto_vendas_url
    click_on "Edit", match: :first

    fill_in "Produto", with: @produto_venda.produto_id
    fill_in "Qtd produtos", with: @produto_venda.qtd_produtos
    fill_in "Valor", with: @produto_venda.valor
    fill_in "Venda", with: @produto_venda.venda_id
    click_on "Update Produto venda"

    assert_text "Produto venda was successfully updated"
    click_on "Back"
  end

  test "destroying a Produto venda" do
    visit produto_vendas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Produto venda was successfully destroyed"
  end
end
