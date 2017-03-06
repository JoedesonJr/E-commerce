package br.ufsm.ecommerce.dao;

import br.ufsm.ecommerce.model.Grupo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GrupoDAO {

    private Connection conn = new PostgreSQLFactory().getConexao();
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;
    private String query;
    private boolean status = false;

    public boolean cadastrarGrupo(Grupo grupo) throws SQLException {

        query = " INSERT INTO grupo (idgrupo, nomegrupo) VALUES (DEFAULT, ?); ";

        try {
            preparedStatement = conn.prepareStatement(query);
                preparedStatement.setString(1, grupo.getGrupo());
            preparedStatement.execute();

            status = true;
        } catch (Exception e) { e.printStackTrace(); }

        conn.close();
        preparedStatement.close();

        return status;
    }

    public ArrayList<Grupo> getGrupos() {

        ArrayList<Grupo> grupos = new ArrayList<Grupo>();

        query = " SELECT * FROM grupo; ";

        try {
            preparedStatement = conn.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (this.resultSet.next()) {
                Grupo grupo = new Grupo();
                    grupo.setIdGrupo(resultSet.getInt("idgrupo"));
                    grupo.setGrupo(resultSet.getString("nomegrupo"));
                grupos.add(grupo);
            }

        } catch (Exception e) { e.printStackTrace(); }

        new PostgreSQLFactory().fecharConexao(conn, preparedStatement, resultSet);

        return grupos;
    }

    public boolean removerGrupo(int idGrupo) throws SQLException {

        query = " BEGIN; " +
            " UPDATE produto SET idGrupo = 1 WHERE idGrupo = ?; " +
            " DELETE FROM grupo WHERE idGrupo = ?; " +
            " COMMIT; ";

        try {
            preparedStatement = conn.prepareStatement(query);
                preparedStatement.setInt(1, idGrupo);
                preparedStatement.setInt(2, idGrupo);
            preparedStatement.execute();

            status = true;
        } catch (Exception e) { e.printStackTrace(); }

        conn.close();
        preparedStatement.close();

        return status;
    }

    public boolean atualizarGrupo(Grupo grupo) throws SQLException {

        query = " UPDATE grupo SET nomegrupo = ? WHERE idgrupo = ?; ";

        try {
            preparedStatement = conn.prepareStatement(query);
                preparedStatement.setString(1, grupo.getGrupo());
                preparedStatement.setInt(2, grupo.getIdGrupo());
            preparedStatement.execute();

            status = true;
        } catch (Exception e) { e.printStackTrace(); }

        conn.close();
        preparedStatement.close();

        return status;
    }
}
