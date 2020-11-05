package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class DAOHistorico {

	private Connection connection;

	public DAOHistorico(){
		this.connection = new ConnectionFactory().getConnection();
	}

	public void create(Historico historico){

		String sql = "insert into Historico"  
				+ "(idHistorico, data, informacoes, idChamado)"
				+ "values (?,?,?,?)";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, historico.getIdHistorico());
			stmt.setDate(2, Date.valueOf(historico.getData()));
			stmt.setString(3, historico.getInformacoes());
			stmt.setInt(4, historico.getIdChamado());

			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Historico> read(){

		String sql = "select * from Historico";

		try{
			List<Historico> historicos = new ArrayList<Historico>();
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while(rs.next()){

				Historico historico = new Historico();
				historico.setIdHistorico(rs.getInt("idHistorico"));
				historico.setData(rs.getDate("data").toLocalDate());
				historico.setInformacoes(rs.getString("informacoes"));
				historico.setIdChamado(rs.getInt("idChamado"));

				historicos.add(historico);
			}

			rs.close();
			stmt.close();
			return historicos;

		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	public Historico getHistorico(int idHistorico){

		String sql = "select * from Historico where idHistorico = ?";

		try{
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setInt(1, idHistorico);
			ResultSet rs = stmt.executeQuery();

			if(rs.next() == true){
				Historico historico = new Historico();
				historico.setIdHistorico(rs.getInt("idHistorico"));
				historico.setData(rs.getDate("data").toLocalDate());
				historico.setInformacoes(rs.getString("informacoes"));
				historico.setIdChamado(rs.getInt("idChamado"));

				rs.close();
				stmt.close();
				return historico;
			}else{
				return null;
			}

		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	public void update(Historico historico){

		String sql = "update Historico set data = ?, informacoes = ?" 
				+ " where idHistorico = ?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setDate(1, Date.valueOf(historico.getData()));
			stmt.setString(2, historico.getInformacoes());
			stmt.setInt(3, historico.getIdHistorico());

			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void delete(Historico historico){

		String sql = "delete from Historico where idHistorico = ?";

		try {
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setInt(1, historico.getIdHistorico());
			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}
	
	public List<Historico> getHistoricoChamado(int idChamado){
		String sql = "select * from Historico where idChamado = ?";

		try{
			List<Historico> historicos = new ArrayList<Historico>();
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setInt(1, idChamado);
			ResultSet rs = stmt.executeQuery();

			while(rs.next()){
				Historico historico = new Historico();
				historico.setIdHistorico(rs.getInt("idHistorico"));
				historico.setData(rs.getDate("data").toLocalDate());
				historico.setInformacoes(rs.getString("informacoes"));
				historico.setIdChamado(rs.getInt("idChamado"));

				historicos.add(historico);
			}

			rs.close();
			stmt.close();
			return historicos;

		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}

	public int getIdHistorico(){
		
		String sql = "select last_insert_id() from Historico";

		try{
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			int lastId = rs.getInt(1);

			stmt.close();
			rs.close();
			return lastId;

		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
