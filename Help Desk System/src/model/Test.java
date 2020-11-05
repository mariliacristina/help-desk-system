package model;

import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


public class Test {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub


		Connection connection = new ConnectionFactory().getConnection();
		System.out.println("Conexão aberta!");
		
		/*String s1 = "Concluido e Atendido Dentro do Prazo"; 
		String s2 = "Concluido Fora do Prazo e Atendido Dentro do Prazo"; 
		String s3 = "Concluido Dentro do Prazo com Atendimento Atrasado";
		String s4 = "Concluido Fora do Prazo com Atendimento Atrasado"; */
		
		Usuario u1 = new Usuario();
		u1.setEmailUsuario("admin@gmail.com");
		u1.setNivelAcesso("Administrador");
		u1.setNome("Marcos Vinicius");
		u1.setSenha("123");
		u1.setTelefone("(88) 99999-8888");
		
//		Chamado c1 = new Chamado();
//		c1.setDescricao("Teste");
//		c1.setAssunto("A");
//		c1.setStatus(s1);
//		c1.setPrioridade("1");
//		c1.setCategoria("Problema");
//		c1.setAtendimentoAtrasado("Nao");
//		c1.setDataAbertura(LocalDate.now());
//		c1.setPrazoAtendimento(LocalDate.now().plusDays(2));
//		c1.setPrazoConclusao(LocalDate.now().plusDays(4));
//	
//		Chamado c2 = new Chamado();
//		c2.setDescricao("Teste");
//		c2.setAssunto("B");
//		c2.setStatus(s1);
//		c2.setPrioridade("2");
//		c2.setCategoria("Problema");
//		c2.setAtendimentoAtrasado("Nao");
//		c2.setDataAbertura(LocalDate.now());
//		c2.setPrazoAtendimento(LocalDate.now().plusDays(4));
//		c2.setPrazoConclusao(LocalDate.now().plusDays(6));
//		
//		Chamado c3 = new Chamado();
//		c3.setDescricao("Teste");
//		c3.setAssunto("C");
//		c3.setStatus(s1);
//		c3.setPrioridade("3");
//		c3.setCategoria("Problema");
//		c3.setAtendimentoAtrasado("Nao");
//		c3.setDataAbertura(LocalDate.now());
//		c3.setPrazoAtendimento(LocalDate.now().plusDays(6));
//		c3.setPrazoConclusao(LocalDate.now().plusDays(8));
//		
//		
//		Chamado c4 = new Chamado();
//		c4.setDescricao("Teste");
//		c4.setAssunto("D");
//		c4.setStatus(s1);
//		c4.setPrioridade("4");
//		c4.setCategoria("Problema");
//		c4.setAtendimentoAtrasado("Nao");
//		c4.setDataAbertura(LocalDate.now());
//		c4.setPrazoAtendimento(LocalDate.now().plusDays(8));
//		c4.setPrazoConclusao(LocalDate.now().plusDays(10));
//		
//		/***********************************************************************************************/
//		
//		Chamado c5 = new Chamado();
//		c5.setDescricao("Teste");
//		c5.setAssunto("E");
//		c5.setStatus(s2);
//		c5.setPrioridade("2");
//		c5.setCategoria("Instalacao");
//		c5.setAtendimentoAtrasado("Nao");
//		c5.setDataAbertura(LocalDate.now());
//		c5.setPrazoAtendimento(LocalDate.now().plusDays(4));
//		c5.setPrazoConclusao(LocalDate.now().plusDays(6));
//		
//		
//		Chamado c6 = new Chamado();
//		c6.setDescricao("Teste");
//		c6.setAssunto("F");
//		c6.setStatus(s2);
//		c6.setPrioridade("3");
//		c6.setCategoria("Instalacao");
//		c6.setAtendimentoAtrasado("Nao");
//		c6.setDataAbertura(LocalDate.now());
//		c6.setPrazoAtendimento(LocalDate.now().plusDays(6));
//		c6.setPrazoConclusao(LocalDate.now().plusDays(8));
//		
//		
//		Chamado c7 = new Chamado();
//		c7.setDescricao("Teste");
//		c7.setAssunto("G");
//		c7.setStatus(s2);
//		c7.setPrioridade("4");
//		c7.setCategoria("Instalacao");
//		c7.setAtendimentoAtrasado("Nao");
//		c7.setDataAbertura(LocalDate.now());
//		c7.setPrazoAtendimento(LocalDate.now().plusDays(8));
//		c7.setPrazoConclusao(LocalDate.now().plusDays(10));
//		
//		/***********************************************************************************************/
//		
//		Chamado c8 = new Chamado();
//		c8.setDescricao("Teste");
//		c8.setAssunto("H");
//		c8.setStatus(s3);
//		c8.setPrioridade("3");
//		c8.setCategoria("Duvida");
//		c8.setAtendimentoAtrasado("Nao");
//		c8.setDataAbertura(LocalDate.now());
//		c8.setPrazoAtendimento(LocalDate.now().plusDays(6));
//		c8.setPrazoConclusao(LocalDate.now().plusDays(8));
//		c8.setIdTecnico("a@a.com");
//		
//		
//		Chamado c9 = new Chamado();
//		c9.setDescricao("Teste");
//		c9.setAssunto("I");
//		c9.setStatus(s3);
//		c9.setPrioridade("4");
//		c9.setCategoria("Duvida");
//		c9.setAtendimentoAtrasado("Nao");
//		c9.setDataAbertura(LocalDate.now());
//		c9.setPrazoAtendimento(LocalDate.now().plusDays(8));
//		c9.setPrazoConclusao(LocalDate.now().plusDays(10));
//		
//		/***********************************************************************************************/
//		
//		Chamado c10 = new Chamado();
//		c10.setDescricao("Teste");
//		c10.setAssunto("J");
//		c10.setStatus(s4);
//		c10.setPrioridade("4");
//		c10.setCategoria("Nao Especificada");
//		c10.setAtendimentoAtrasado("Nao");
//		c10.setDataAbertura(LocalDate.now());
//		c10.setPrazoAtendimento(LocalDate.now().plusDays(8));
//		c10.setPrazoConclusao(LocalDate.now().plusDays(10));
		
		
		Servicos s = new Servicos();
		
		try{
		
			s.cadastrarUsuario(u1);
//			s.atualizarInformacoesChamado(c1);
//			s.atualizarInformacoesChamado(c5);
//			s.atualizarInformacoesChamado(c8);
//			s.atualizarInformacoesChamado(c10);
			
			//s.gerarRelatorioTecnico("a@a.com");
			
			
//			s.abrirChamado(c1);
//			s.abrirChamado(c2);
//			s.abrirChamado(c3);
//			s.abrirChamado(c4);
//			s.abrirChamado(c5);
//			s.abrirChamado(c6);
//			s.abrirChamado(c7);
//			s.abrirChamado(c8);
//			s.abrirChamado(c9);
//			s.abrirChamado(c10);
			
		}catch(RuntimeException e){
			System.out.println(e.getMessage());
		}
		
		
		connection.close();

	}

}
