<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.Usuario" %>
<%@ page import = "model.Chamado" %>
<%@ page import = "model.Historico" %>
<%@ page import = "model.Servicos" %>
<%@ page import = "java.time.LocalDate" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sistema HelpDesk</title>
</head>
<body>
		<%
			Usuario usuario = (Usuario) session.getAttribute("usuario");

			Chamado chamado = new Chamado();
			chamado.setAssunto(request.getParameter("assunto"));
			chamado.setCategoria(request.getParameter("categoria"));
			chamado.setDescricao(request.getParameter("descricao"));
			chamado.setIdChamado(Integer.parseInt(request.getParameter("idChamado")));
			chamado.setIdTecnico(request.getParameter("idTecnico"));
			chamado.setPrioridade(request.getParameter("prioridade"));
			
			chamado.setAtendimentoAtrasado(request.getParameter("atendimentoAtrasado"));
			chamado.setPrazoConclusao(LocalDate.parse(request.getParameter("prazoConclusao")));
			chamado.setPrazoAtendimento(LocalDate.parse(request.getParameter("prazoAtendimento")));
			
			
			if(chamado.getAtendimentoAtrasado().equals("Nao") && chamado.getPrazoConclusao().isBefore(LocalDate.now())){
				chamado.setStatus("Concluido e Atendido Dentro do Prazo");	
			}else if (chamado.getAtendimentoAtrasado().equals("Nao") && chamado.getPrazoConclusao().isAfter(LocalDate.now())){
				chamado.setStatus("Concluido Fora do Prazo e Atendido Dentro do Prazo");
			}else if (chamado.getAtendimentoAtrasado().equals("Sim") && chamado.getPrazoConclusao().isBefore(LocalDate.now())){
				chamado.setStatus("Concluido Dentro do Prazo com Atendimento Atrasado");
			}else{
				chamado.setStatus("Concluido Fora do Prazo com Atendimento Atrasado");
			}
			
			
			
			//Enviar email ao request.getParameter("idCliente") informando q o chamado foi concluido

			try {
				Servicos servicos = new Servicos();
				servicos.enviarEmail(request.getParameter("idCliente"), "Olá," + usuario.getNome() + ", seu chamado foi concluído");


				servicos.atualizarInformacoesChamado(chamado);
				
				Historico historico = new Historico();
				historico.setData(LocalDate.now());
				historico.setInformacoes("O chamado foi concluido");
				historico.setIdChamado(chamado.getIdChamado());
				servicos.criarHistorico(historico);

				if (usuario.getNivelAcesso().equals("Tecnico")) {
		%>
					<jsp:forward page="chamadosTecnico.jsp" />		
			<% 	}else if(usuario.getNivelAcesso().equals("Administrador")){ %>
					<jsp:forward page="chamadosAdmin.jsp" />		
			<% 	}
			
			}catch(RuntimeException e){
				System.out.println(e);
			}
		%>
</body>
</html>