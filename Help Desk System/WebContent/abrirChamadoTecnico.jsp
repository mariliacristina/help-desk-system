<%@ page import="model.Usuario"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Creative - Bootstrap 3 Responsive Admin Template">
<meta name="author" content="GeeksLabs">
<meta name="keyword"
	content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
<link rel="shortcut icon" href="img/favicon.png">

<title>Sistema HelpDesk</title>

<link href="SweetAlert/sweetalert.css" rel="stylesheet">
<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="css/bootstrap-theme.css" rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="css/elegant-icons-style.css" rel="stylesheet" />
<link href="css/font-awesome.min.css" rel="stylesheet" />
<!-- Custom styles -->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->
</head>

<body>
<% Usuario usuario = (Usuario) session.getAttribute("usuario"); 
    %>
	<!-- container section start -->
	<section id="container" class="">
		<!--header start-->
		<header class="header dark-bg">
			<div class="toggle-nav">
				<div class="icon-reorder tooltips"
					data-original-title="Toggle Navigation" data-placement="bottom">
					<i class="icon_menu"></i>
				</div>
			</div>

			<!--logo start-->
			<a href="index.html" class="logo">Help <span class="lite">Desk</span></a>
			<!--logo end-->

			<div class="nav search-row" id="top_menu"></div>

			<div class="top-nav notification-row">                
                <!-- notificatoin dropdown start-->
                <ul class="nav pull-right top-menu">
                    
                    <!-- alert notification end-->
                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="profile-ava">
                                <img alt="" src="img/avatar1_small.jpg">
                            </span>
                            <span class="username"><%= usuario.getNome()%></span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <div class="log-arrow-up"></div>
                            <li class="eborder-top">
                                <a href="profileTecnico.jsp"><i class="icon_profile"></i> Perfil</a>
                            </li>                                                                                 
                            <li>
                                <a href="sairConta.jsp"><i class="icon_key_alt"></i> Sair</a>
                            </li>
                        </ul>
                    </li>
                    <!-- user login dropdown end -->
                </ul>
                <!-- notificatoin dropdown end-->
            </div>
      </header>
		<!--header end-->

		<!--sidebar start-->
		<aside>
			<div id="sidebar" class="nav-collapse ">
				<!-- sidebar menu start-->
				<ul class="sidebar-menu">
					<li class="active"><a href="obterChamado.jsp">
							<button type="button" class="btn btn-primary">Obter
								Chamado</button>
					</a>
					<li class=""><a class="" href="indexTecnico.jsp"> <i
							class="icon_house_alt"></i> <span>Home</span>
					</a></li>
					<li><a class="" href="abrirChamadoTecnico.jsp"> <i
							class="icon_document_alt"></i> <span>Abrir Chamado</span>
					</a></li>
					<li class="sub-menu"><a href="javascript:;" class=""> <i
							class="icon_folder"></i> <span>Meus Chamados</span> <span
							class="menu-arrow arrow_carrot-right"></span>
					</a>
						<ul class="sub">
							<li><a class="" href="chamadosTecnico.jsp">Todos</a></li>
							<li><a class="" href="chamadosTecnicoAtendimento.jsp">Em atendimento</a></li>
							<li><a class="" href="chamadosTecnicoEspera.jsp">Em espera</a></li>
							<li><a class="" href="chamadosTecnicoAtrasados.jsp">Atrasados</a></li>
							<li><a class="" href="chamadosTecnicoCancelados.jsp">Cancelados</a></li>							
							<li><a class="" href="chamadosTecnicoConcluidos.jsp">Conclu\EDdos</a></li>
							<!--<li><a class="" href="grids.html">Grids</a></li> -->
						</ul></li>
					<li class="sub-menu"><a href="javascript:;" class=""> <i
							class="icon_documents_alt"></i> <span>Chamados Abertos</span> <span
							class="menu-arrow arrow_carrot-right"></span>
					</a>
						<ul class="sub">
							<li><a class="" href="chamadosDoTecnico.jsp">Todos</a></li>
							<li><a class="" href="chamadosDoTecnicoAtendimento.jsp">Em atendimento</a></li>
							<li><a class="" href="chamadosDoTecnicoEspera.jsp">Em espera</a></li>
							<li><a class="" href="chamadosDoTecnicoAtrasados.jsp">Atrasados</a></li>
							<li><a class="" href="chamadosDoTecnicoCancelados.jsp">Cancelados</a></li>
							<li><a class="" href="chamadosDoTecnicoConcluidos.jsp">Conclu\EDdos</a></li>
							<!--<li><a class="" href="grids.html">Grids</a></li> -->
						</ul></li>
					<li><a class="" href="transferenciasTecnico.jsp"> <i
							class="icon_cloud-download"></i> <span>Transfer\EAncias</span>
					</a></li>
					<li><a class="" href="estatisticasTecnico.jsp"> <i
							class="icon_piechart"></i> <span>Estat\ED\ADsticas</span>

					</a></li>
				</ul>
				<!-- sidebar menu end-->
			</div>
		</aside>
		<!--sidebar end-->

		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<i class="fa fa-files-o"></i> Abrir Chamado
						</h3>
						<ol class="breadcrumb">
							<li><i class="icon_document_alt"></i>Abrir Chamado</li>
						</ol>
					</div>
				</div>
				<!-- Form validations -->
				<div class="row">
					<div class="col-lg-12">
						<section class="panel">
							<header class="panel-heading"> Abrir Chamado </header>
							<div class="panel-body">
								<div class="form">
									<form method="post" action="cadastrarChamado.jsp" id = "formEnviar">
										<div class="form-validate form-horizontal" id="feedback_form">
											<div class="form-group ">
												<label for="cemail" class="control-label col-lg-2">Assunto
													<span class="required">*</span>
												</label>
												<div class="col-lg-6">
													<input class="form-control " id="assunto" type="text"
														name="assunto" required />
												</div>
											</div>

											<div class="form-group ">
												<label class="control-label col-lg-2">Categoria
													<span class="required">*</span>
												</label>
												<div class="col-lg-2">
													<select class="form-control m-bot15" name="categoria">
														<option selection = true disabled = disabled></option>
														<option value="1">Dúvida</option>
														<option value="2">Instalação</option>
														<option value="3">Problema</option>
														<option value="4" selected>Não especificada</option>
													</select>
												</div>
												<div class="form-group ">
													<label for="cname" class="control-label col-lg-2">Prioridade
														<span class="required">*</span>
													</label>
													<div class="col-lg-2">
														<select class="form-control m-bot15" name="prioridade">
															<option selection = true disabled = disabled></option>
															<option value="1" selected>Baixa</option>
															<option value="2">Média</option>
															<option value="3">Alta</option>
															<option value="4">Urgente</option>
														</select>
													</div>
												</div>
											</div>


											<div class="form-group ">
												<label for="ccomment" class="control-label col-lg-2">Descri\E7\E3o
													<span class="required">*</span>
												</label>
												<div class="col-lg-10">
													<textarea class="form-control " id="descricao"
														name="descricao" required></textarea>
												</div>
											</div>
											<div class="form-group">
												<div class="col-lg-offset-2 col-lg-10">
													<button id = "sucesso" class="btn btn-primary" type="submit"onclick = "validation();">Salvar</button>
													<button class="btn btn-default" type="button">Cancelar</button>
												</div>
											</div>
									</form>
								</div>
							</div>
					</div>
			</section>
			</div>
			</div>
			<!-- page end-->
		</section>
	</section>
	<!--main content end-->
	<div class="text-right">
		
	</div>
	</section>
	<!-- container section end -->

	<!-- javascripts -->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- nice scroll-->
	<script src="js/jquery.scrollTo.min.js"></script>
	<script src="js/jquery.nicescroll.js" type="text/javascript"></script>

	<!-- jquery validate js -->
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>

	<!-- custom form validation script for this page-->
	<script src="js/form-validation-script.js"></script>
	<!--custome script for all page-->
	<script src="js/scripts.js"></script>
	<script src="SweetAlert/sweetalert.min.js"></script>
	<script>
        document.querySelector('#formEnviar').addEventListener('submit', function(e) {
        var form = this;
         e.preventDefault();          
                    swal({
                        title: "Sucesso!",			  
				        timer: 1000,
				        type: "success",
				        showConfirmButton: false
                    }, function() {
                        form.submit();
                    });

            });
    </script>
	


</body>
</html>
