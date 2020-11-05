<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Usuario"%>
<%@ page import = "model.Servicos" %>
<%@ page import="model.Chamado"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="model.Historico"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Sistema Help Desk</title>
<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="css/styleLogin.css">
</head>

<body>

	<% 
		Servicos servicos = new Servicos();
		
		List<Chamado> lista = new ArrayList<>();
		lista = servicos.obterChamadosAtrasados();
		for(Chamado chamado : lista){
			chamado.setPrazoAtendimento(LocalDate.now().plusDays(2));
			chamado.setPrazoConclusao(LocalDate.now().plusDays(4));
			chamado.setPrioridade("1");
			chamado.setAtendimentoAtrasado("Sim");
			servicos.atualizarInformacoesChamado(chamado);
			
			Historico historico = new Historico();
			historico.setData(LocalDate.now());
			historico.setIdChamado(chamado.getIdChamado());
			historico.setInformacoes("O prazo de atendimento venceu. A prioridade foi alterada para 1");
			servicos.criarHistorico(historico);
		}
	
	   Usuario usuario = (Usuario) session.getAttribute("usuario"); 
		
	   if(usuario != null){
		   if(usuario.getNivelAcesso().equals("Administrador")){ %>
		       <jsp:forward page="indexAdm.jsp" />
	<% 	   }else if(usuario.getNivelAcesso().equals("Cliente")){ %>
	           <jsp:forward page="indexCliente.jsp" />
	<% 	   }else{  %>
	           <jsp:forward page="indexTecnico.jsp" />
	<%     }   %>
	<% }else { %>
			
	<section id="banner">
	<div class="inner">
		<header>
		<div class="form">

			<ul class="tab-group">
				<li class="tab active"><a href="#signup">Cadastro</a></li>
				<li class="tab "><a href="#login">Login</a></li>
			</ul>
			
			${verifica} 
			
			<div class="tab-content">
				<div id="signup">
					<h1>Help Desk</h1>

					<form action="cadastro.jsp" method="post">

						<div class="top-row">
							<div class="field-wrap">
								<label> Nome <span class="req">*</span>
								</label> <input type="text" name="firstName" required autocomplete="off" pattern = "^[a-zA-ZáéíóúÁÉÍÓÚâêîôûÂÊÎÔÛãẽõũÃẼÕŨç ]*$" />
							</div>

							<div class="field-wrap">
								<label> Sobrenome<span class="req">*</span>
								</label> <input type="text" name="lastName" required autocomplete="off" pattern = "^[a-zA-ZáéíóúÁÉÍÓÚâêîôûÂÊÎÔÛãẽõũÃẼÕŨç ]*$" />
							</div>
						</div>

						<div class="top-row">
							<div class="field-wrap">
								<label> Email<span class="req">*</span>
								</label> <input type="text" name="email" required autocomplete="off" pattern = "^[a-zA-Z][a-zA-Z0-9_]*@[a-zA-Z]+.com(.br)?$"/>
							</div>
							

							<div class="field-wrap">
								<label for "phone"> Telefone<span class="req">*</span>
								</label> <input type="text" name="phone" id = "phone" required autocomplete="off" pattern="^\([0-9]{2}\)[\s][0-9]{5}-[0-9]{4}$" />
							</div>
						</div>

						<div class="field-wrap">
							<label> Senha<span class="req">*</span>
							</label> <input type="password" name="password" id = "password" required
								autocomplete="off" />
						</div>

						<div class="field-wrap">
							<label> Confirmar Senha<span class="req">*</span>
							</label> <input type="password" name="confirmPassword" id = "confirm_password" required
								autocomplete="off" />
						</div>
						${messageRegister}	
						

						<button type="submit" class="button button-block" >
						Começar
						</button>

					</form>

				</div>


				<div id="login">

					<h1>Bem vindo !</h1>

					<form action="autenticacao.jsp" method="post">

						<div class="field-wrap">
							<label> Email<span class="req">*</span>
							</label> <input type="email" name="email" id = "emailLogin" required autocomplete="off" pattern = "^[a-zA-Z][a-zA-Z0-9_]*@[a-zA-Z]+.com(.br)?$" />
						</div>

						<div class="field-wrap">
							<label> Senha<span class="req">*</span>
							</label> <input type="password" name="password" id = "passwordLogin" required autocomplete="off" onchange = "validatePasswordLogin"/>							
						</div>
						${message}
						
						<button class="button button-block" >
						Login
						</button>
							
					</form>

				</div>

			</div>
			<!-- tab-content -->

		</div>
		<!-- /form --> </header>

	</div>
	</section>


	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="js/indexLogin.js"></script>
	
	<script type="text/javascript" src = "js/jquery.mask.min.js"/></script>
	<script type="text/javascript">$("#phone").mask("(00) 00000-0009");</script>
	<script> 
		
		var password = document.getElementById("password"), confirm_password = document.getElementById("confirm_password");
		
		function validatePassword(){
			if(password.value != confirm_password.value){
				confirm_password.setCustomValidity("Passwords don't match!");
			}else{
				confirm_password.setCustomValidity('');
				
			}
			
		}
		
		password.onchange = validatePassword;
		confirm_password.onkeyup = validatePassword;
		
	</script>
	
	<%}%>

</body>
</html>