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
			chamado.setDescricao(request.getParameter("descricao") + " " + request.getParameter("descricaoEditada")); 
			chamado.setIdChamado(Integer.parseInt(request.getParameter("idChamado")));
			chamado.setIdTecnico(request.getParameter("idTecnico"));
			chamado.setPrioridade(request.getParameter("prioridade"));
			chamado.setStatus(request.getParameter("status"));
			chamado.setDataAbertura(LocalDate.parse(request.getParameter("dataAbertura")));
			chamado.setPrazoAtendimento(LocalDate.parse(request.getParameter("prazoAtendimento")));
			chamado.setPrazoConclusao(LocalDate.parse(request.getParameter("prazoConclusao")));
			chamado.setAtendimentoAtrasado(request.getParameter("atendimentoAtrasado"));
		
			try{
				Servicos s = new Servicos();
				
				s.atualizarInformacoesChamado(chamado);
				
				if(usuario.getNivelAcesso().equals("Tecnico")){ %>
					<jsp:forward page="chamadosDoTecnico.jsp" />		
			<% 	}else if(usuario.getNivelAcesso().equals("Administrador")){ %>
					<jsp:forward page="chamadosDoAdmin.jsp" />		
			<% 	}
			
			}catch(RuntimeException e){ System.out.println(e);
				if(usuario.getNivelAcesso().equals("Tecnico")){ %>
					<jsp:forward page="chamadosDoTecnico.jsp" />		
			<% 	}else if(usuario.getNivelAcesso().equals("Administrador")){ %>
					<jsp:forward page="chamadosDoAdmin.jsp" />		
			<% 	}
			}
		%>
</body>
</html>
