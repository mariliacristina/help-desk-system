<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.Servicos" %>
<%@ page import = "model.Usuario" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>   </title>
</head>
<body>
	
	<% String email = request.getParameter("email");  
	   String password = request.getParameter("password");
	   
	   Servicos services = new Servicos();
	   
	   Usuario usuario = services.getInfUsuario(email);
	   
	   if(usuario != null){
		   if(usuario.getSenha().equals(password)){ 
			   session.setAttribute("usuario", usuario);
		       if(usuario.getNivelAcesso().equals("Administrador")){ %>
		           <jsp:forward page="indexAdm.jsp" />
	<% 	   	   }else if(usuario.getNivelAcesso().equals("Cliente")){ %>
	               <jsp:forward page="indexCliente.jsp" />
	<% 	       }else{  %>
	               <jsp:forward page="indexTecnico.jsp" />
	<%         } 
	        }else {
	      	  request.setAttribute("message", "<div class=\"alert alert-danger \"><strong>Senha Inválida!</strong></div>");
	          request.setAttribute("verifica", "<style> .tab-content > div {display: none; } .tab-content > div:last-child{ display: table;} </style>"); %>
			  <jsp:forward page="indexLogin.jsp" />
 	<% 	 	}
	   }else {
		   request.setAttribute("message", "<div class=\"alert alert-danger \"><strong>Email Inválido!</strong></div>"); 
		   request.setAttribute("verifica", "<style> .tab-content > div {display: none; } .tab-content > div:last-child{ display: table;} </style>"); %>
		   <jsp:forward page="indexLogin.jsp" />
	<% }
	   
	%>
</body>
</html>