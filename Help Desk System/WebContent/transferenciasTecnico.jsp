<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Usuario"%>
<%@ page import="model.Servicos"%>
<%@ page import="model.Chamado"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Sistema HelpDesk</title>

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
                <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"><i class="icon_menu"></i></div>
            </div>

            <!--logo start-->
            <a href="indexTecnico.jsp" class="logo">Help <span class="lite">Desk</span></a>
            <!--logo end-->

            <div class="nav search-row" id="top_menu">                     
            </div>

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

      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-table"></i> Transferências</h3>
					<ol class="breadcrumb">
					    <li><i class="fa fa-home"></i><a href="indexTecnico.jsp">Home</a></li>
						<li><i class="fa fa-th-list"></i>Transferências</li>
					</ol>
				</div>
			</div>
              <!-- page start-->
              
             
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                             Transferidos para mim
                          </header>
                          
                          <table class="table table-striped table-advance table-hover">
                           <tbody>
                              <tr>
                                 <th><i class="icon_profile"></i> Técnico</th>     
                                 <th><i class="icon_clock_alt"></i> Situação</th>
                                 <th><i class="icon_folder"></i> Categoria</th>         
                                 <th><i class="icon_star"></i> Prioridade</th>
                                 <th><i class="icon_calendar"></i> Prazo de Conclusão</th>
                                 <th><i class="icon_cogs"></i> Ação</th>
                              </tr>
                              
                              <%                              	
                              
                              		Servicos s = new Servicos();
                              		List<Chamado> lista = s.getChamadosTransferidos(usuario.getEmailUsuario());
                              		
                              		for(Chamado c : lista){ %>
                              			<tr>
                                 			<td><%= c.getIdTecnico()%></td>       
                                 			<td><%= c.getStatus()%></td>
                                 			<td><%= c.getCategoria()%></td>
                                 			<td><% if(c.getPrioridade().equals("1")){
												   		out.println("Urgente");                                 				
                                 				   }else if(c.getPrioridade().equals("2")){
                                 					  	out.println("Alta");
                                 				   }else if(c.getPrioridade().equals("3")){
                                 						out.println("Média");
                                 				   }else if(c.getPrioridade().equals("4")){
                                 				   		out.println("Baixa");
                                 				   }
                                 				%>
                                 			</td>
                                 			<td><%= c.getPrazoConclusao()%></td> 
                                 			<td>
                                            <div class="btn-group">
                                            	<form action="meusChamadosTecnicoTransf.jsp" method="post">
                                            		<input type="hidden" value="<%=c.getStatus()%>" name="status">
                                            		<input type="hidden" value="<%=c.getAssunto()%>" name="assunto">
                                            		<input type="hidden" value="<%=c.getDataAbertura()%>" name="dataAbertura">
													<input type="hidden" value="<%=c.getPrazoConclusao()%>" name="prazoConclusao">
													<input type="hidden" value="<%=c.getPrazoAtendimento()%>" name="prazoAtendimento">
													<input type="hidden" value="<%=c.getCategoria()%>" name="categoria">
													<input type="hidden" value="<%=c.getPrioridade()%>" name="prioridade">
													<input type="hidden" value="<%=c.getDescricao()%>" name="descricao">
													<input type="hidden" value="<%=c.getIdChamado()%>" name="idChamado">
													<input type="hidden" value="<%=c.getIdCliente()%>" name="idCliente">
													<input type="hidden" value="<%=c.getIdTecnico()%>" name="idTecnico">
													<input type="hidden" value="<%= c.getAtendimentoAtrasado()%>" name="atendimentoAtrasado" />
													<input type="hidden" value="<%=c.getIdTecnicoTransf()%>" name="idTecnicoTransf">
													<button class="btn btn-primary" type="submit" value="" class="icon_zoom-in" >
														<i class="icon_zoom-in"></i>
												    </button>
												    <!--a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
													<a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a-->
												</form>
												
												<form action="aceitarTransferencia.jsp" method="post">
                                            		<input type="hidden" value="<%=c.getStatus()%>" name="status">
                                            		<input type="hidden" value="<%=c.getAssunto()%>" name="assunto">
                                            		<input type="hidden" value="<%=c.getDataAbertura()%>" name="dataAbertura">
													<input type="hidden" value="<%=c.getPrazoConclusao()%>" name="prazoConclusao">
													<input type="hidden" value="<%=c.getPrazoAtendimento()%>" name="prazoAtendimento">
													<input type="hidden" value="<%=c.getCategoria()%>" name="categoria">
													<input type="hidden" value="<%=c.getPrioridade()%>" name="prioridade">
													<input type="hidden" value="<%=c.getDescricao()%>" name="descricao">
													<input type="hidden" value="<%=c.getIdChamado()%>" name="idChamado">
													<input type="hidden" value="<%=c.getIdCliente()%>" name="idCliente">
													<input type="hidden" value="<%=c.getIdTecnico()%>" name="idTecnico">
													<input type="hidden" value="<%= c.getAtendimentoAtrasado()%>" name="atendimentoAtrasado" />
													<input type="hidden" value="<%=c.getIdTecnicoTransf()%>" name="idTecnicoTransf">
													<button class="btn btn-success" type="submit" value="" class="icon_check_alt2" >
														<i class="icon_check_alt2"></i>
												    </button>
												    <!--a class="btn btn-primary" href="#"><i class="icon_zoom-in"></i></a>
													<a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a-->
												</form>
												
												<form action="recusarTransferencia.jsp" method="post">
                                            		<input type="hidden" value="<%=c.getStatus()%>" name="status">
                                            		<input type="hidden" value="<%=c.getAssunto()%>" name="assunto">
                                            		<input type="hidden" value="<%=c.getDataAbertura()%>" name="dataAbertura">
													<input type="hidden" value="<%=c.getPrazoConclusao()%>" name="prazoConclusao">
													<input type="hidden" value="<%=c.getPrazoAtendimento()%>" name="prazoAtendimento">
													<input type="hidden" value="<%=c.getCategoria()%>" name="categoria">
													<input type="hidden" value="<%=c.getPrioridade()%>" name="prioridade">
													<input type="hidden" value="<%=c.getDescricao()%>" name="descricao">
													<input type="hidden" value="<%=c.getIdChamado()%>" name="idChamado">
													<input type="hidden" value="<%=c.getIdCliente()%>" name="idCliente">
													<input type="hidden" value="<%=c.getIdTecnico()%>" name="idTecnico">
													<input type="hidden" value="<%= c.getAtendimentoAtrasado()%>" name="atendimentoAtrasado" />
													<input type="hidden" value="<%=c.getIdTecnicoTransf()%>" name="idTecnicoTransf">
													<button class="btn btn-danger" type="submit" value="" class="icon_close_alt2" >
														<i class="icon_close_alt2"></i>
												    </button>
												    <!--a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
													<a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a-->
												</form>
                                            </div> 
                                         </td> 
                              			</tr>
                              <% 	}
                              %>
                          </tbody>
                        </table>
                      </section>
                  </div>
              </div>
              <!-- page end-->
          </section>
      </section>
      <!--main content end-->
      <div class="text-right">
            <div class="credits">
                <!-- 
                    All the links in the footer should remain intact. 
                    You can delete the links only if you purchased the pro version.
                    Licensing information: https://bootstrapmade.com/license/
                    Purchase the pro version form: https://bootstrapmade.com/buy/?theme=NiceAdmin
                -->
            </div>
        </div>
  </section>
  <!-- container section end -->
    <!-- javascripts -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- nicescroll -->
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <!--custome script for all page-->
    <script src="js/scripts.js"></script>


  </body>
</html>
