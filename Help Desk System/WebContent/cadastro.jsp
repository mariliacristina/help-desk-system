<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "model.Servicos" %>
<%@ page import = "model.Usuario" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		
		Usuario usuario = new Usuario();
		usuario.setNome(firstName + " " + lastName);
		usuario.setEmailUsuario(email);
		usuario.setTelefone(phone);
		usuario.setSenha(password);
		usuario.setNivelAcesso("Cliente");
		
		Servicos s = new Servicos();
		
		try{
			s.cadastrarUsuario(usuario);
			session.setAttribute("usuario", usuario);	%>
			<jsp:forward page="indexCliente.jsp" />
	<% 	}catch(RuntimeException e){
		  	request.setAttribute("messageRegister","<div class=\"alert alert-danger \"><strong>Email já cadastrado</strong></div>"); 
		  	request.setAttribute("verifica", ""); %>
		  	<jsp:forward page="indexLogin.jsp" />
	<% 	 }
	%>

</body>
</html>