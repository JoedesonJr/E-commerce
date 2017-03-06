package br.ufsm.ecommerce.dao;

import java.sql.*;

public class PostgreSQLFactory {

	public Connection getConexao() {

		Connection conn = null;

		String host = "200.132.36.170";
		String database = "dbecommerce";
		String user = "postgres";
		String password = "amj!#7";

		String url = "jdbc:postgresql://" +host +":5432/" +database;

		try {
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}

	public void fecharConexao(Connection connection,
		PreparedStatement preparedStatement, ResultSet resultSet) {
		try {
			connection.close();
			preparedStatement.close();
			resultSet.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
