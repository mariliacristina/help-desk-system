package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class DAOChamado {

	private Connection connection;

	public DAOChamado(){
		this.connection = new ConnectionFactory().getConnection();
	}

	public void create(Chamado chamado){

		String sql = "insert into Chamado"  
				+ "(descricao, assunto, status, prioridade, categoria, atendimentoAtrasado, dataAbertura, prazoAtendimento, prazoConclusao, idCliente, idTecnico, idTecnicoTransf)"
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, chamado.getDescricao());
			stmt.setString(2, chamado.getAssunto());
			stmt.setString(3, chamado.getStatus());
			stmt.setString(4, chamado.getPrioridade());
			stmt.setString(5, chamado.getCategoria());
			stmt.setString(6, chamado.getAtendimentoAtrasado());
			stmt.setDate(7, Date.valueOf(chamado.getDataAbertura()));
			stmt.setDate(8, Date.valueOf(chamado.getPrazoAtendimento()));
			stmt.setDate(9, Date.valueOf(chamado.getPrazoConclusao()));
			stmt.setString(10, chamado.getIdCliente());
			stmt.setString(11, chamado.getIdTecnico());
			stmt.setString(12, chamado.getIdTecnicoTransf());

			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Chamado> read(){

		String sql = "select * from Chamado";

		try{
			List<Chamado> chamados = new ArrayList<Chamado>();
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while(rs.next()){

				Chamado chamado = new Chamado();
				chamado.setIdChamado(rs.getInt("idChamado"));
				chamado.setDescricao(rs.getString("descricao"));
				chamado.setAssunto(rs.getString("assunto"));
				chamado.setStatus(rs.getString("status"));
				chamado.setPrioridade(rs.getString("prioridade"));
				chamado.setCategoria(rs.getString("categoria"));
				chamado.setAtendimentoAtrasado(rs.getString("atendimentoAtrasado"));
				chamado.setDataAbertura(rs.getDate("dataAbertura").toLocalDate());
				chamado.setPrazoAtendimento(rs.getDate("prazoAtendimento").toLocalDate());
				chamado.setPrazoConclusao(rs.getDate("prazoConclusao").toLocalDate());
				chamado.setIdCliente(rs.getString("idCliente"));
				chamado.setIdTecnico(rs.getString("idTecnico"));
				chamado.setIdTecnicoTransf(rs.getString("idTecnicoTransf"));

				chamados.add(chamado);
			}

			rs.close();
			stmt.close();
			return chamados;

		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}

	public Chamado getChamado(int idChamado){

		String sql = "select * from Chamado where idChamado = ?";

		try{
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setInt(1, idChamado);
			ResultSet rs = stmt.executeQuery();

			if(rs.next() == true){
				Chamado chamado = new Chamado();
				chamado.setIdChamado(rs.getInt("idChamado"));
				chamado.setDescricao(rs.getString("descricao"));
				chamado.setAssunto(rs.getString("assunto"));
				chamado.setStatus(rs.getString("status"));
				chamado.setPrioridade(rs.getString("prioridade"));
				chamado.setCategoria(rs.getString("categoria"));
				chamado.setAtendimentoAtrasado(rs.getString("atendimentoAtrasado"));
				chamado.setDataAbertura(rs.getDate("dataAbertura").toLocalDate());
				chamado.setPrazoAtendimento(rs.getDate("prazoAtendimento").toLocalDate());
				chamado.setPrazoConclusao(rs.getDate("prazoConclusao").toLocalDate());
				chamado.setIdCliente(rs.getString("idCliente"));
				chamado.setIdTecnico(rs.getString("idTecnico"));
				chamado.setIdTecnicoTransf(rs.getString("idTecnicoTransf"));

				rs.close();
				stmt.close();
				return chamado;
			}else{
				return null;
			}

		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}

	public List<Chamado> getChamadoCliente(String idCliente){

		String sql = "select * from Chamado where idCliente = ?";

		try{
			List<Chamado> chamados = new ArrayList<Chamado>();
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1, idCliente);
			ResultSet rs = stmt.executeQuery();

			while(rs.next()){

				Chamado chamado = new Chamado();
				chamado.setIdChamado(rs.getInt("idChamado"));
				chamado.setDescricao(rs.getString("descricao"));
				chamado.setAssunto(rs.getString("assunto"));
				chamado.setStatus(rs.getString("status"));
				chamado.setPrioridade(rs.getString("prioridade"));
				chamado.setCategoria(rs.getString("categoria"));
				chamado.setAtendimentoAtrasado(rs.getString("atendimentoAtrasado"));
				chamado.setDataAbertura(rs.getDate("dataAbertura").toLocalDate());
				chamado.setPrazoAtendimento(rs.getDate("prazoAtendimento").toLocalDate());
				chamado.setPrazoConclusao(rs.getDate("prazoConclusao").toLocalDate());
				chamado.setIdCliente(rs.getString("idCliente"));
				chamado.setIdTecnico(rs.getString("idTecnico"));
				chamado.setIdTecnicoTransf(rs.getString("idTecnicoTransf"));

				chamados.add(chamado);
			}

			rs.close();
			stmt.close();
			return chamados;

		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}

	public List<Chamado> getChamadoTecnico(String idTecnico){

		String sql = "select * from Chamado where idTecnico = ?";

		try{
			List<Chamado> chamados = new ArrayList<Chamado>();
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1, idTecnico);
			ResultSet rs = stmt.executeQuery();

			while(rs.next()){

				Chamado chamado = new Chamado();
				chamado.setIdChamado(rs.getInt("idChamado"));
				chamado.setDescricao(rs.getString("descricao"));
				chamado.setAssunto(rs.getString("assunto"));
				chamado.setStatus(rs.getString("status"));
				chamado.setPrioridade(rs.getString("prioridade"));
				chamado.setCategoria(rs.getString("categoria"));
				chamado.setAtendimentoAtrasado(rs.getString("atendimentoAtrasado"));
				chamado.setDataAbertura(rs.getDate("dataAbertura").toLocalDate());
				chamado.setPrazoAtendimento(rs.getDate("prazoAtendimento").toLocalDate());
				chamado.setPrazoConclusao(rs.getDate("prazoConclusao").toLocalDate());
				chamado.setIdCliente(rs.getString("idCliente"));
				chamado.setIdTecnico(rs.getString("idTecnico"));
				chamado.setIdTecnicoTransf(rs.getString("idTecnicoTransf"));

				chamados.add(chamado);
			}

			rs.close();
			stmt.close();
			return chamados;

		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}

	public List<Chamado> getChamadosTransferidos(String idTecnicoTransf){

		String sql = "select * from Chamado where idTecnicoTransf = ?";

		try{
			List<Chamado> chamados = new ArrayList<Chamado>();
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1, idTecnicoTransf);
			ResultSet rs = stmt.executeQuery();

			while(rs.next()){

				Chamado chamado = new Chamado();
				chamado.setIdChamado(rs.getInt("idChamado"));
				chamado.setDescricao(rs.getString("descricao"));
				chamado.setAssunto(rs.getString("assunto"));
				chamado.setStatus(rs.getString("status"));
				chamado.setPrioridade(rs.getString("prioridade"));
				chamado.setCategoria(rs.getString("categoria"));
				chamado.setAtendimentoAtrasado(rs.getString("atendimentoAtrasado"));
				chamado.setDataAbertura(rs.getDate("dataAbertura").toLocalDate());
				chamado.setPrazoAtendimento(rs.getDate("prazoAtendimento").toLocalDate());
				chamado.setPrazoConclusao(rs.getDate("prazoConclusao").toLocalDate());
				chamado.setIdCliente(rs.getString("idCliente"));
				chamado.setIdTecnico(rs.getString("idTecnico"));
				chamado.setIdTecnicoTransf(rs.getString("idTecnicoTransf"));

				chamados.add(chamado);
			}

			rs.close();
			stmt.close();
			return chamados;

		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}

	public void update(Chamado chamado){

		String sql = "update Chamado set descricao = ?, assunto = ?, status = ?, prioridade = ?," 
				+ "categoria = ?, atendimentoAtrasado = ?, prazoAtendimento = ?, prazoConclusao = ?, idTecnico = ?, idTecnicoTransf = ?" 
				+ " where idChamado = ?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, chamado.getDescricao());
			stmt.setString(2, chamado.getAssunto());
			stmt.setString(3, chamado.getStatus());
			stmt.setString(4, chamado.getPrioridade());
			stmt.setString(5, chamado.getCategoria());
			stmt.setString(6, chamado.getAtendimentoAtrasado());
			stmt.setDate(7, Date.valueOf(chamado.getPrazoAtendimento()));
			stmt.setDate(8, Date.valueOf(chamado.getPrazoConclusao()));
			stmt.setString(9, chamado.getIdTecnico());
			stmt.setString(10, chamado.getIdTecnicoTransf());
			stmt.setInt(11, chamado.getIdChamado());

			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void delete(Chamado chamado){

		String sql = "delete from Chamado where idChamado = ?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, chamado.getIdChamado());
			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public int getIdChamado(){

		String sql = "select last_insert_id() from Chamado";

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

	public Chamado obterChamado(){

		String sql = "select * from Chamado where status = 'Aberto'"
				+ " order by datediff(prazoAtendimento, date(now())), prioridade";

		try{

			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			if(!rs.next()){
				
				return null;
			}
							

			Chamado chamado = new Chamado();
			chamado.setIdChamado(rs.getInt("idChamado"));
			chamado.setDescricao(rs.getString("descricao"));
			chamado.setAssunto(rs.getString("assunto"));
			chamado.setStatus(rs.getString("status"));
			chamado.setPrioridade(rs.getString("prioridade"));
			chamado.setCategoria(rs.getString("categoria"));
			chamado.setAtendimentoAtrasado(rs.getString("atendimentoAtrasado"));
			chamado.setDataAbertura(rs.getDate("dataAbertura").toLocalDate());
			chamado.setPrazoAtendimento(rs.getDate("prazoAtendimento").toLocalDate());
			chamado.setPrazoConclusao(rs.getDate("prazoConclusao").toLocalDate());
			chamado.setIdCliente(rs.getString("idCliente"));
			chamado.setIdTecnico(rs.getString("idTecnico"));
			chamado.setIdTecnicoTransf(rs.getString("idTecnicoTransf"));

			stmt.close();
			rs.close();
			return chamado;

		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Chamado> getChamadosAtrasados(){

		String sql = "select * from Chamado where status = 'Aberto'"
				+ "and datediff(prazoAtendimento, date(now())) < 0 ";

		try{
			List<Chamado> chamados = new ArrayList<Chamado>();
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while(rs.next()){

				Chamado chamado = new Chamado();
				chamado.setIdChamado(rs.getInt("idChamado"));
				chamado.setDescricao(rs.getString("descricao"));
				chamado.setAssunto(rs.getString("assunto"));
				chamado.setStatus(rs.getString("status"));
				chamado.setPrioridade(rs.getString("prioridade"));
				chamado.setCategoria(rs.getString("categoria"));
				chamado.setAtendimentoAtrasado(rs.getString("atendimentoAtrasado"));
				chamado.setDataAbertura(rs.getDate("dataAbertura").toLocalDate());
				chamado.setPrazoAtendimento(rs.getDate("prazoAtendimento").toLocalDate());
				chamado.setPrazoConclusao(rs.getDate("prazoConclusao").toLocalDate());
				chamado.setIdCliente(rs.getString("idCliente"));
				chamado.setIdTecnico(rs.getString("idTecnico"));
				chamado.setIdTecnicoTransf(rs.getString("idTecnicoTransf"));

				chamados.add(chamado);
			}

			rs.close(); 
			stmt.close();
			return chamados;

		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * Chamados por Categoria
	 * Obtém a quantidade de chamados abertos por categoria
	 */
	public int getQtdChamadosCategoria(String categoria){

		String sql = "select count(*) from Chamado where categoria = ?";

		try{

			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1, categoria);
			ResultSet rs = stmt.executeQuery();
			
			rs.next();
			int qtd = rs.getInt(1);

			stmt.close();
			rs.close();
			return qtd;

		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/* Obtém a quantidade total usuários ou técnicos ou administradores cadastrados no sistema,
	 * dependendo no nível de acesso passado
	 * */
	
	public int getQtdEnvolvidos(String nivelAcesso){ //Trocar nome envolvidos

		String sql = "select count(*) from Usuario where nivelAcesso = ?";

		try{

			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, nivelAcesso);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			int qtd = rs.getInt(1);
			stmt.close();
			rs.close();
			return qtd;

		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/*
	 * Retorna a quantidade de chamados concluídos por determinado técnico dentro do prazo de conclusao e 
	 * dentro de prazo de atendimento
	 */
	public int getQtdChamadosTecnicoConcPrazo(String idTecnico){

		String sql = "select count(*) from Chamado where idTecnico = ? and "
				   + "dataAbertura between date(now()) and date_sub(date(now()), interval -30 day) and status = "
				   + "'Concluido e Atendido Dentro do Prazo'";
		
		try{
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, idTecnico);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			int qtd = rs.getInt(1);
			stmt.close();
			rs.close();
			return qtd;

		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * Retorna a quantidade de chamados concluídos por determinado técnico fora do prazo de conclusao e 
	 * dentro de prazo de atendimento
	 */
	public int getQtdChamadosTecnicoForaPrazo(String idTecnico){

		String sql = "select count(*) from Chamado where idTecnico = ? and "
				   + "dataAbertura between date(now()) and date_sub(date(now()), interval -30 day) and status = "
				   + "'Concluido Fora do Prazo e Atendido Dentro do Prazo'";
		try{

			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, idTecnico);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			int qtd = rs.getInt(1);
			stmt.close();
			rs.close();
			return qtd;

		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * Retorna a quantidade de chamados concluídos por determinado técnico dentro do prazo de conclusao e 
	 * fora de prazo de atendimento
	 */
	public int getQtdChamadosTecnicoDentroPrazoForaAtend(String idTecnico){

		String sql = "select count(*) from Chamado where idTecnico = ? and "
				   + "dataAbertura between date(now()) and date_sub(date(now()), interval -30 day) and status = "
				   + "'Concluido Dentro do Prazo com Atendimento Atrasado'";

		try{

			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, idTecnico);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			int qtd = rs.getInt(1);
			stmt.close();
			rs.close();
			return qtd;

		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * Retorna a quantidade de chamados concluídos por determinado técnico fora do prazo de conclusao e 
	 * fora de prazo de atendimento
	 */
	public int getQtdChamadosTecnicoForaPrazoForaAtend(String idTecnico){

		String sql = "select count(*) from Chamado where idTecnico = ? and "
				   + "dataAbertura between date(now()) and date_sub(date(now()), interval -30 day) and status = "
				   + "'Concluido Fora do Prazo com Atendimento Atrasado'";

		try{

			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, idTecnico);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			int qtd = rs.getInt(1);
			stmt.close();
			rs.close();
			return qtd;

		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * Retorna a quantidade total de chamados cancelados de um técnico 
	 */
	public int getQtdChamadosTecnicoCancelados(String idTecnico){

		String sql = "select count(*) from Chamado where status = 'Cancelado' and idTecnico = ? and "
				   + "dataAbertura between date(now()) and date_sub(date(now()), interval -30 day)";

		try{
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, idTecnico);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			int qtd = rs.getInt(1);
			stmt.close();
			rs.close();
			return qtd;

		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * Retorna a quantidade total de chamados abertos em determiado prazo
	 */
	public int getQtdTotalDeChamadosAbertos(){

		String sql = "select count(*) from Chamado where "
				   + "dataAbertura between date(now()) and date_sub(date(now()), interval -30 day)";

		try{
			PreparedStatement stmt = connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			int qtd = rs.getInt(1);
			stmt.close();
			rs.close();
			return qtd;

		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * Retorna a quantidade total de chamados cancelados
	 */
	public int getQtdTotalDeChamadosCancelados(){

		String sql = "select count(*) from Chamado where status = 'Cancelado' and "
				   + "dataAbertura between date(now()) and date_sub(date(now()), interval -30 day)";

		try{
			PreparedStatement stmt = connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			int qtd = rs.getInt(1);
			stmt.close();
			rs.close();
			return qtd;

		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * Retorna a quantidade total de chamados concluídos dentro do prazo de conclusao e 
	 * dentro de prazo de atendimento
	 */
	public int getQtdTotalChamadosConcPrazo(){

		String sql = "select count(*) from Chamado where "
				   + "dataAbertura between date(now()) and date_sub(date(now()), interval -30 day) and status = "
				   + "'Concluido e Atendido Dentro do Prazo'";
		try{

			PreparedStatement stmt = connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			int qtd = rs.getInt(1);
			stmt.close();
			rs.close();
			return qtd;

		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * Retorna a quantidade total de chamados concluídos fora do prazo de conclusao e 
	 * dentro de prazo de atendimento
	 */
	public int getQtdTotalChamadosForaPrazo(){

		String sql = "select count(*) from Chamado where "
				   + "dataAbertura between date(now()) and date_sub(date(now()), interval -30 day) and status = "
				   + "'Concluido Fora do Prazo e Atendido Dentro do Prazo'";
		try{

			PreparedStatement stmt = connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			int qtd = rs.getInt(1);
			stmt.close();
			rs.close();
			return qtd;

		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * Retorna a quantidade total de chamados concluídos dentro do prazo de conclusao e 
	 * fora de prazo de atendimento
	 */
	public int getQtdTotalChamadosDentroPrazoForaAtend(){

		String sql = "select count(*) from Chamado where "
				   + "dataAbertura between date(now()) and date_sub(date(now()), interval -30 day) and status = "
				   + "'Concluido Dentro do Prazo com Atendimento Atrasado'";

		try{

			PreparedStatement stmt = connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			int qtd = rs.getInt(1);
			stmt.close();
			rs.close();
			return qtd;

		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * Retorna a quantidade total de chamados concluídos fora do prazo de conclusao e 
	 * fora de prazo de atendimento
	 */
	public int getQtdTotalChamadosForaPrazoForaAtend(){

		String sql = "select count(*) from Chamado where "
				   + "dataAbertura between date(now()) and date_sub(date(now()), interval -30 day) and status = "
				   + "'Concluido Fora do Prazo com Atendimento Atrasado'";

		try{

			PreparedStatement stmt = connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			int qtd = rs.getInt(1);
			stmt.close();
			rs.close();
			return qtd;

		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
}