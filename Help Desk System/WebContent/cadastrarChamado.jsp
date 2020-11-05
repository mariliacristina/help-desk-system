<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "model.Chamado" %>
<%@ page import = "model.Servicos" %>
<%@ page import = "model.Usuario" %>
<%@ page import = "model.Historico" %>
<%@ page import = "java.time.LocalDate" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8-ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<%
			String descricao = request.getParameter("descricao");
			String assunto = request.getParameter("assunto");
			String prioridade = request.getParameter("prioridade");
			String categoria = request.getParameter("categoria");

			Chamado chamado = new Chamado();
			chamado.setDescricao(descricao);
			chamado.setAssunto(assunto);
			
			switch (prioridade) {
			case "1":
				chamado.setPrioridade("1");
				chamado.setPrazoAtendimento(LocalDate.now().plusDays(2));
				chamado.setPrazoConclusao(LocalDate.now().plusDays(4));
				break;
			case "2":
				chamado.setPrioridade("2");
				chamado.setPrazoAtendimento(LocalDate.now().plusDays(4));
				chamado.setPrazoConclusao(LocalDate.now().plusDays(6));
				break;
			case "3":
				chamado.setPrioridade("3");
				chamado.setPrazoAtendimento(LocalDate.now().plusDays(6));
				chamado.setPrazoConclusao(LocalDate.now().plusDays(8));
				break;
			case "4":
				chamado.setPrioridade("4");
				chamado.setPrazoAtendimento(LocalDate.now().plusDays(8));
				chamado.setPrazoConclusao(LocalDate.now().plusDays(10));
				break;
			default:
				chamado.setPrioridade("1");
				chamado.setPrazoAtendimento(LocalDate.now().plusDays(2));
				chamado.setPrazoConclusao(LocalDate.now().plusDays(4));
				break;
			}
			
			switch (categoria) {
			case "1":
				chamado.setCategoria("Duvida");
				break;
			case "2":
				chamado.setCategoria("Instalacao");
				break;
			case "3":
				chamado.setCategoria("Problema");
				break;
			case "4":
				chamado.setCategoria("Nao Especificada");
				break;
			default:
				chamado.setCategoria("Nao Especificada");
				break;
			}

			chamado.setStatus("Aberto");
			chamado.setAtendimentoAtrasado("Nao");
			chamado.setDataAbertura(LocalDate.now());
			Usuario usuario = (Usuario) session.getAttribute("usuario");
			chamado.setIdCliente(usuario.getEmailUsuario());

			Servicos servicos = new Servicos();
			Historico historico = new Historico();
			
			try {
				servicos.abrirChamado(chamado);
				int id = servicos.obterIdChamado();
				historico.setData(LocalDate.now());
				historico.setIdChamado(id);
				historico.setInformacoes("O chamado foi aberto");
				servicos.criarHistorico(historico);
				
				if(usuario.getNivelAcesso().equals("Cliente")){%>
					<jsp:forward page = "chamadosCliente.jsp" />
			<%  }else if(usuario.getNivelAcesso().equals("Tecnico")){ %>
					<jsp:forward page = "chamadosDoTecnico.jsp" />
			<%  }else{ %>
					<jsp:forward page = "chamadosDoAdmin.jsp" />
			<%  }
		 	}catch (RuntimeException e) {
		 		if(usuario.getNivelAcesso().equals("Cliente")){%>
					<jsp:forward page = "chamadosCliente.jsp" />
		    <%  }else if(usuario.getNivelAcesso().equals("Tecnico")){ %>
					<jsp:forward page = "chamadosDoTecnico.jsp" />
		    <%  }else{ %>
					<jsp:forward page = "chamadosDoAdmin.jsp" />
		    <%  }
			} %>
</body>
</html>