package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOUsuario {

	private Connection connection;

	public DAOUsuario(){

		this.connection = new ConnectionFactory().getConnection(); 
	}

	public void create(Usuario usuario){

		String sql = "insert into Usuario"  
				+ "(nome, emailUsuario, senha, telefone, nivelAcesso)"
				+ "values (?,?,?,?,?)";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario.getNome());
			stmt.setString(2, usuario.getEmailUsuario());
			stmt.setString(3, usuario.getSenha());
			stmt.setString(4, usuario.getTelefone());
			stmt.setString(5, usuario.getNivelAcesso());

			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Usuario> read(){

		String sql = "select * from Usuario";

		try{
			List<Usuario> usuarios = new ArrayList<Usuario>();
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while(rs.next()){

				Usuario usuario = new Usuario();
				usuario.setNome(rs.getString("nome"));
				usuario.setEmailUsuario(rs.getString("emailUsuario"));
				usuario.setSenha(rs.getString("senha"));
				usuario.setTelefone(rs.getString("telefone"));
				usuario.setNivelAcesso(rs.getString("nivelAcesso"));

				usuarios.add(usuario);
			}

			rs.close();
			stmt.close();
			return usuarios;

		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}

	public List<Usuario> getListaClientes(){

		String sql = "select * from Usuario where nivelAcesso = \"Cliente\" ";

		try{
			List<Usuario> usuarios = new ArrayList<Usuario>();
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while(rs.next()){

				Usuario usuario = new Usuario();
				usuario.setNome(rs.getString("nome"));
				usuario.setEmailUsuario(rs.getString("emailUsuario"));
				usuario.setSenha(rs.getString("senha"));
				usuario.setTelefone(rs.getString("telefone"));
				usuario.setNivelAcesso(rs.getString("nivelAcesso"));

				usuarios.add(usuario);
			}

			rs.close();
			stmt.close();
			return usuarios;

		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}

	public List<Usuario> getListaTecnicos(){

		String sql = "select * from Usuario where nivelAcesso = \"Técnico\" ";

		try{
			List<Usuario> usuarios = new ArrayList<Usuario>();
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while(rs.next()){

				Usuario usuario = new Usuario();
				usuario.setNome(rs.getString("nome"));
				usuario.setEmailUsuario(rs.getString("emailUsuario"));
				usuario.setSenha(rs.getString("senha"));
				usuario.setTelefone(rs.getString("telefone"));
				usuario.setNivelAcesso(rs.getString("nivelAcesso"));

				usuarios.add(usuario);
			}

			rs.close();
			stmt.close();
			return usuarios;

		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	public List<Usuario> getListaAdmin(){

		String sql = "select * from Usuario where nivelAcesso = \"Administrador\" ";

		try{
			List<Usuario> usuarios = new ArrayList<Usuario>();
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while(rs.next()){

				Usuario usuario = new Usuario();
				usuario.setNome(rs.getString("nome"));
				usuario.setEmailUsuario(rs.getString("emailUsuario"));
				usuario.setSenha(rs.getString("senha"));
				usuario.setTelefone(rs.getString("telefone"));
				usuario.setNivelAcesso(rs.getString("nivelAcesso"));

				usuarios.add(usuario);
			}

			rs.close();
			stmt.close();
			return usuarios;

		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	public Usuario getUsuario(String email){

		String sql = "select * from Usuario where emailUsuario = ?";

		try{
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1, email);
			ResultSet rs = stmt.executeQuery();

			if(rs.next() == true){
				Usuario usuario = new Usuario();
				usuario.setNome(rs.getString("nome"));
				usuario.setEmailUsuario(rs.getString("emailUsuario"));
				usuario.setSenha(rs.getString("senha"));
				usuario.setTelefone(rs.getString("telefone"));
				usuario.setNivelAcesso(rs.getString("nivelAcesso"));

				rs.close();
				stmt.close();
				return usuario;
			}else{
				return null;
			}
		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	public void setNivelAcesso(String emailUsuario, String nivelAcesso){
		String sql = "update Usuario set nivelAcesso = ?" 
				+ " where emailUsuario = ?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, nivelAcesso);
			stmt.setString(2, emailUsuario);

			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void update(Usuario usuario){

		String sql = "update Usuario set nome = ?, senha = ?, telefone = ?, nivelAcesso = ?" 
				+ " where emailUsuario = ?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario.getNome());
			stmt.setString(2, usuario.getSenha());
			stmt.setString(3, usuario.getTelefone());
			stmt.setString(4, usuario.getNivelAcesso());
			stmt.setString(5, usuario.getEmailUsuario());

			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void delete(Usuario usuario){

		String sql = "delete from Usuario where emailUsuario = ?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario.getEmailUsuario());
			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

}
