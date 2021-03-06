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
			chamado.setDataAbertura(LocalDate.parse(request.getParameter("dataAbertura")));
			chamado.setPrazoAtendimento(LocalDate.parse(request.getParameter("prazoAtendimento")));
			chamado.setPrazoConclusao(LocalDate.parse(request.getParameter("prazoConclusao")));
			chamado.setAtendimentoAtrasado(request.getParameter("atendimentoAtrasado"));
			chamado.setIdCliente(request.getParameter("idCliente")); 
			//chamado.setIdTecnicoTransf(request.getParameter("idTecnicoTransf"));

			
			chamado.setStatus("Em Espera");
		
			//Enviar email ao request.getParameter("idCliente") informando q o chamado foi colocado em espera e o motivo
			String motivoPendencia = request.getParameter("motivoPendencia");
			
			//try{
				Servicos s = new Servicos();
				
				s.atualizarInformacoesChamado(chamado);
				s.enviarEmail(request.getParameter("idCliente"), "O chamado foi colocado em pendência. Motivo: " + motivoPendencia);
				Historico h = new Historico();
				h.setData(LocalDate.now());
				h.setInformacoes("O chamado foi colocado em espera");
				h.setIdChamado(chamado.getIdChamado());
				s.criarHistorico(h);
				
				if(usuario.getNivelAcesso().equals("Tecnico")){ %>
					<jsp:forward page="chamadosTecnico.jsp" />		
			<% 	}else if(usuario.getNivelAcesso().equals("Administrador")){ %>
					<jsp:forward page="chamadosAdmin.jsp" />		
			<% 	}
			
			//}catch(RuntimeException e){
				if(usuario.getNivelAcesso().equals("Tecnico")){ %>
					<jsp:forward page="chamadosTecnico.jsp" />		
			<% 	}else if(usuario.getNivelAcesso().equals("Administrador")){ %>
					<jsp:forward page="chamadosAdmin.jsp" />		
			<% 	}
			//}
		%>
</body>
</html>
