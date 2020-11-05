<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Usuario"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Sistema Help Desk</title>


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
  <% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>
  <!-- container section start -->
  <section id="container" class="">
      <!--header start-->
         <header class="header dark-bg">
            <div class="toggle-nav">
                <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"><i class="icon_menu"></i></div>
            </div>

            <!--logo start-->
            <a href="indexTecncio.jsp" class="logo">Help <span class="lite">Desk</span></a>
            <!--logo end-->

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
					<li class="active"><a class="cadastrarChamado.jsp" href="obterChamado.jsp">
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
					<h3 class="page-header"><i class="fa fa-user-md"></i> Perfil</h3>
					<ol class="breadcrumb">					
						<li><i class="fa fa-user-md"></i>Profile</li>
					</ol>
				</div>
			</div>
              <div class="row">
                <!-- profile-widget -->
                <div class="col-lg-12">
                    <div class="profile-widget profile-widget-info">
                          <div class="panel-body">
                            <div class="col-lg-2 col-sm-2">
                              <h4><%= usuario.getNome() %></h4>               
                              <div class="follow-ava">
                                  <img src="img/profile-widget-avatar.jpg" alt="">
                              </div>
                              <h5><%= usuario.getNivelAcesso()%></h5>
                            </div>                                                        
                            
                          </div>
                    </div>
                </div>
              </div>
              <!-- page start-->
              <div class="row">
                 <div class="col-lg-12">
                    <section class="panel">
                          <header class="panel-heading tab-bg-info">
                              <ul class="nav nav-tabs">                                  
                                  <li class="active">
                                      <a data-toggle="tab" href="#profile">
                                          <i class="icon-user"></i>
                                          Perfil
                                      </a>
                                  </li>
                                  <li class="">
                                      <a data-toggle="tab" href="#edit-profile">
                                          <i class="icon-envelope"></i>
                                          Editar Perfil
                                      </a>
                                  </li>
                              </ul>
                          </header>
                          <div class="panel-body">
                              <div class="tab-content">
                                  <div id="profile" class="tab-pane active">
                                      <div class="profile-activity">                                          
                                          <div class="act-time">                                      
                                              <div class="activity-body act-in">
                                                  <span class="arrow"></span>                                                                                                  
                                              </div>
                                          </div>
                                          <div class="act-time">                                      
                                              <div class="activity-body act-in">
                                                  <span class="arrow"></span>
                                                  <div class="text">
                                                     <div class="panel-body bio-graph-info">
                                           <h1>Biografia</h1>
                                          <div class="row">
                                              <div class="bio-row">
                                              <% String nome[] = usuario.getNome().split(" ");

                                              %>
                                               
                                                  <p><span>Nome</span>: <%= nome[0]%> </p>
                                              </div>
                                              <div class="bio-row">
                                                  <p><span>Sobrenome </span>: <%= nome[1]%> </p>
                                              </div>                                                                                            
                                              <div class="bio-row">
                                                  <p><span>Email </span>:<%= usuario.getEmailUsuario()%></p>
                                              </div>                                              
                                              <div class="bio-row">
                                                  <p><span>Telefone </span>:  <%= usuario.getTelefone()%></p>
                                              </div>
                                          </div>
                                      </div>
                                                  </div>
                                              </div>
                                          </div>                                                                                    
                                                                                                                                                                                                                

                                      </div>
                                  </div>
                                  <!-- profile -->
                               
                                  
                                  <!-- edit-profile -->
                                  <div id="edit-profile" class="tab-pane">
                                    <section class="panel">                                          
                                          <div class="panel-body bio-graph-info">
                                              <h1> Profile Info</h1>
                                              <form class="form-horizontal" action = "alterarUsuario.jsp" method = "post">                                                  
                                                  <div class="form-group">
                                                      <label class="col-lg-2 control-label">Nome</label>
                                                      <div class="col-lg-6">
                                                          <input type="text" class="form-control" name="f-name" placeholder="<%= nome[0]%> ">
                                                      </div>
                                                  </div>
                                                  <div class="form-group">
                                                      <label class="col-lg-2 control-label">Sobrenome</label>
                                                      <div class="col-lg-6">
                                                          <input type="text" class="form-control" name="l-name" placeholder="<%= nome[1]%>" >
                                                      </div>
                                                  </div>
                                                  <div class="form-group">
                                                      <label class="col-lg-2 control-label">Telefone</label>
                                                      <div class="col-lg-10">
                                                      	  <input type="text" class="form-control"  name="telefone" placeholder="<%= usuario.getTelefone()%>">
                                                      </div>
                                                  </div>                                                                                                                                          
                                                  <div class="form-group">
                                                      <div class="col-lg-offset-2 col-lg-10">
                                                          <button type="submit" class="btn btn-primary">Save</button>
                                                          <button type="button" class="btn btn-danger">Cancel</button>
                                                      </div>
                                                  </div>
                                              </form>
                                          </div>
                                      </section>
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
      
  </section>
  <!-- container section end -->
    <!-- javascripts -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <!-- jquery knob -->
    <script src="assets/jquery-knob/js/jquery.knob.js"></script>
    <!--custome script for all page-->
    <script src="js/scripts.js"></script>

  <script>

      //knob
      $(".knob").knob();

  </script>


  </body>
</html>
