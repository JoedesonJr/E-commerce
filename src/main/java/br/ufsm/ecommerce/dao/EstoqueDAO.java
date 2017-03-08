package br.ufsm.ecommerce.dao;

import br.ufsm.ecommerce.model.Estoque;
import br.ufsm.ecommerce.model.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EstoqueDAO {

    private Connection conn = new PostgreSQLFactory().getConexao();
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;
    private String query;
    private boolean status = false;

    public ArrayList<Estoque> getEstoque() {

        ArrayList<Estoque> estoques = new ArrayList<Estoque>();

        query = " SELECT idestoque, codigoproduto, nomeproduto, medida, preco, " +
            " st, lote, validade, quantidade, qtdminima FROM estoque, produto " +
            " WHERE produto.idproduto = estoque.idproduto; ";

        try {
            preparedStatement = conn.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (this.resultSet.next()) {
                Estoque estoque = new Estoque();
                    estoque.setIdEstoque(resultSet.getInt("idestoque"));
                    Produto produto = new Produto();
                        produto.setNome(resultSet.getString("nomeproduto"));
                        produto.setCodigo(resultSet.getString("codigoproduto"));
                        produto.setMedida(resultSet.getString("medida"));
                    estoque.setProduto(produto);
                    estoque.setPreco(resultSet.getFloat("preco"));
                    estoque.setSt(resultSet.getInt("st"));
                    estoque.setLote(resultSet.getString("lote"));
                    estoque.setValidade(resultSet.getDate("validade"));
                    estoque.setQuantidade(resultSet.getInt("quantidade"));
                    estoque.setQtdMinima(resultSet.getInt("qtdminima"));
                estoques.add(estoque);
            }

        } catch (Exception e) { e.printStackTrace(); }

        new PostgreSQLFactory().fecharConexao(conn, preparedStatement, resultSet);

        return estoques;
    }

    public boolean registrarProduto(Estoque estoque) throws Exception {

        query = " UPDATE estoque SET quantidade = ?, preco = ?, st = ?, " +
            " lote = ?, validade = ?, qtdminima = ? WHERE idestoque = ?;";

        preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, estoque.getQuantidade());
            preparedStatement.setFloat(2, estoque.getPreco());
            preparedStatement.setInt(3, estoque.getSt());
            preparedStatement.setString(4, estoque.getLote());
            preparedStatement.setDate(5, estoque.getValidade());
            preparedStatement.setInt(6, estoque.getQtdMinima());
            preparedStatement.setInt(7, estoque.getIdEstoque());
        preparedStatement.execute();

        if(preparedStatement.getUpdateCount() > 0) status = true;

        conn.close();
        preparedStatement.close();

        return status;
    }
}
