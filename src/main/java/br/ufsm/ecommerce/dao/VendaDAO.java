package br.ufsm.ecommerce.dao;

import br.ufsm.ecommerce.model.Cartao;
import br.ufsm.ecommerce.model.Grupo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class VendaDAO {

    private Connection conn = new PostgreSQLFactory().getConexao();
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;
    private String query;
    private boolean status = false;

    public ArrayList<Cartao> getCartao() throws SQLException {

        ArrayList<Cartao> cartoes = new ArrayList<Cartao>();

        query = " SELECT * FROM cartao_credito; ";

        try {
            preparedStatement = conn.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (this.resultSet.next()) {
                Cartao cartao = new Cartao();
                    cartao.setIdCartao(resultSet.getInt("idcartao"));
                    cartao.setBandeira(resultSet.getString("bandeira"));
                    cartao.setAceito(resultSet.getBoolean("aceito"));
                cartoes.add(cartao);
            }

        } catch (Exception e) { e.printStackTrace(); }

        new PostgreSQLFactory().fecharConexao(conn, preparedStatement, resultSet);

        return cartoes;
    }

    public boolean cadastrarCartoes(ArrayList<Cartao> cartoes) throws SQLException {

        query = " BEGIN; " +
            " UPDATE cartao_credito SET aceito = ? WHERE idcartao = ?; " +
            " UPDATE cartao_credito SET aceito = ? WHERE idcartao = ?; " +
            " UPDATE cartao_credito SET aceito = ? WHERE idcartao = ?; " +
            " UPDATE cartao_credito SET aceito = ? WHERE idcartao = ?; " +
            " UPDATE cartao_credito SET aceito = ? WHERE idcartao = ?; " +
        " COMMIT; ";

        try {
            preparedStatement = conn.prepareStatement(query);
            int i = 1;
            for (Cartao cartao : cartoes) {
                preparedStatement.setBoolean(i, cartao.isAceito());
                i++;
                preparedStatement.setInt(i, cartao.getIdCartao());
                i++;
            }
            preparedStatement.execute();

            status = true;
        } catch (Exception e) { e.printStackTrace(); }

        conn.close();
        preparedStatement.close();

        return status;
    }
}
