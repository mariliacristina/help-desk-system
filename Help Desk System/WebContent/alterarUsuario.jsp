<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.Usuario"%>
<%@ page import = "model.Servicos"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
			Usuario usuario = (Usuario) session.getAttribute("usuario");
			String nome[] = usuario.getNome().split(" ");
			String nomeNovo;
			System.out.println(request.getParameter("l-name"));
			


		
			if(request.getParameter("f-name").equals("") && !request.getParameter("l-name").equals("")){
				nomeNovo = nome[0] + " "+ request.getParameter("l-name");
				usuario.setNome(nomeNovo);
				System.out.println("aqui");
			}else if(!request.getParameter("f-name").equals("") && request.getParameter("l-name").equals("")){
				nomeNovo = request.getParameter("f-name") + " "+ nome[1];
				System.out.println("aqui2");
				
				usuario.setNome(nomeNovo);
			}else if(!request.getParameter("f-name").equals("") && !request.getParameter("l-name").equals("")){
				nomeNovo = request.getParameter("f-name") + " "+ request.getParameter("l-name");
				System.out.println("aqui3");
				usuario.setNome(nomeNovo);
			}
		
			if(!request.getParameter("telefone").equals("")){
				usuario.setTelefone(request.getParameter("telefone"));
			}
			
			Servicos s = new Servicos();
			
			try{
				s.atualizarInformacoesUsuario(usuario);
				
				if(usuario.getNivelAcesso().equals("Administrador")){ %>
					<jsp:forward page = "profileAdm.jsp"/>	
			<% 	}else if(usuario.getNivelAcesso().equals("Tecnico")){ %>
					<jsp:forward page = "profileTecnico.jsp"/>
			<% 	}else{ %>
					<jsp:forward page = "profileCliente.jsp"/>
			<% 	}
			}catch(RuntimeException e){
				if(usuario.getNivelAcesso().equals("Administrador")){ %>
					<jsp:forward page = "profileAdm.jsp"/>	
			<% 	}else if(usuario.getNivelAcesso().equals("Tecnico")){ %>
					<jsp:forward page = "profileTecnico.jsp"/>
			<% 	}else{ %>
					<jsp:forward page = "profileCliente.jsp"/>
			<% 	}
			}
			
		%>
</body>
</html>