<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.Servicos"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
			Servicos s = new Servicos();
			String nivelAcesso;	
		
			if(request.getParameter("nivelAcesso").equals("c")){
				nivelAcesso = "Cliente";
			}else if(request.getParameter("nivelAcesso").equals("t")){
				nivelAcesso = "Tecnico";
			}else{
				nivelAcesso = "Administrador";
			}
		
			s.setNivelAcesso(request.getParameter("emailUsuario"), nivelAcesso);
			
		   if (request.getParameter("nivellUsuario").equals("Cliente")){%>
	           <jsp:forward page="listaDeClientes.jsp" /> 
<% 	   	   }else if(request.getParameter("nivellUsuario").equals("Tecnico")){ %>
               <jsp:forward page="listaDeTecnicos.jsp" />
<% 	       }else{  %>
             <jsp:forward page="listaDeAdmin.jsp" />
<%         } 
			
		%>
		 
		
</body>
</html>