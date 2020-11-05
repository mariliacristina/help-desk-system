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
			
			if(!request.getParameter("idTecnico").equals("null")){
				chamado.setIdTecnico(request.getParameter("idTecnico"));
			}
			
			chamado.setIdCliente(request.getParameter("idCliente"));
			chamado.setPrioridade(request.getParameter("prioridade"));			
			chamado.setStatus("Cancelado");		
			chamado.setPrazoAtendimento(LocalDate.parse(request.getParameter("prazoAtendimento")));
			chamado.setAtendimentoAtrasado(request.getParameter("atendimentoAtrasado"));
			chamado.setPrazoConclusao(LocalDate.parse(request.getParameter("prazoConclusao")));
		
			//Enviar email ao request.getParameter("idTecnico") informando q o chamado foi cancelado
			
			try{
				Servicos s = new Servicos();
				s.enviarEmail(request.getParameter("idCliente"), "Olá," + usuario.getNome() + ", seu chamado foi cancelado");
				
				s.atualizarInformacoesChamado(chamado);
		
				Historico h = new Historico();
				h.setData(LocalDate.now());
				h.setInformacoes("O chamado foi cancelado");
				h.setIdChamado(chamado.getIdChamado());
				s.criarHistorico(h);
				
				if(usuario.getNivelAcesso().equals("Tecnico")){ %>
					<jsp:forward page="chamadosDoTecnico.jsp" />		
			<% 	}else if(usuario.getNivelAcesso().equals("Administrador")){ %>
					<jsp:forward page="chamadosDoAdmin.jsp" />		
			<% 	}else{ %>
					<jsp:forward page="chamadosCliente.jsp" />
			<% 	}
			
			}catch(RuntimeException e){
				System.out.println(e);
				if(usuario.getNivelAcesso().equals("Tecnico")){ %>
					<jsp:forward page="chamadosDoTecnico.jsp" />		
			<% 	}else if(usuario.getNivelAcesso().equals("Administrador")){ %>
					<jsp:forward page="chamadosDoAdmin.jsp" />		
			<% 	}else{ %>
					<jsp:forward page="chamadosCliente.jsp" />
			<% 	}
			}
		%>
</body>
</html>