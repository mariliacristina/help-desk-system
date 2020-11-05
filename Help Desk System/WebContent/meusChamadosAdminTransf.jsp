<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Usuario"%>
<%@ page import="model.Servicos"%>
<%@ page import="model.Historico"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8-ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
  <meta name="author" content="GeeksLabs">
  <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">    
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
  <link href="css/myStyle.css" rel="stylesheet" />
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
        <a href="indexAdm.jsp" class="logo">Help <span class="lite">Desk</span></a>
        
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
                                <a href="profileAdm.jsp"><i class="icon_profile"></i> Perfil</a>
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
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu">  
              
                <li class="active">
                      <a class="" href="obterChamado.jsp">
                         <button type="button" class="btn btn-primary">Obter Chamado</button>
                      </a> 
                      
                 </li>                                                                              
                  <li class="">
                      <a class="" href="indexAdm.jsp">
                          <i class="icon_house_alt"></i>
                          <span>Home</span>
                      </a>  
                      
                  </li>       
                  <li>                                                                                                                
                      <a class="" href="abrirChamadoAdmin.jsp">
                          <i class="icon_document_alt"></i>
                          <span>Abrir Chamado</span>                                                 
                      </a>
                                         
                  </li>                          
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_folder"></i>
                          <span>Meus Chamados</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="chamadosAdmin.jsp">Todos</a></li>
                          <li><a class="" href="chamadosAdminAtendimento.jsp">Em andamento</a></li>
                          <li><a class="" href="chamadosAdminEspera.jsp">Em espera</a></li>
						  <li><a class="" href="chamadosAdminAtrasados.jsp">Atrasados</a></li>
                          <li><a class="" href="chamadosAdminCancelados.jsp">Cancelados</a></li>
                          <li><a class="" href="chamadosAdminConcluidos.jsp">Concluídos</a></li>                             
                          <!--<li><a class="" href="grids.html">Grids</a></li> -->
                      </ul>
                  </li> 
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_documents_alt"></i>
                          <span>Chamados Abertos</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="chamadosDoAdmin.jsp">Todos</a></li>
                          <li><a class="" href="chamadosDoAdminAtendimento.jsp">Em andamento</a></li>
                          <li><a class="" href="chamadosDoAdminEspera.jsp">Em espera</a></li>
						  <li><a class="" href="chamadosDoAdminAtrasados.jsp">Atrasados</a></li>
                          <li><a class="" href="chamadosDoAdminCancelados.jsp">Cancelados</a></li>
                          <li><a class="" href="chamadosDoAdminConcluidos.jsp">Concluídos</a></li>                             
                          <!--<li><a class="" href="grids.html">Grids</a></li> -->
                      </ul>
                  </li> 
                  <li>                     
                      <a class="" href="transferenciasAdmin.jsp">
                          <i class="icon_cloud-download"></i>
                          <span>Transferências</span>                          
                      </a>
                                         
                  </li>                   
                  <li>                     
                      <a class="" href="escolherRelatorioAdm.jsp">
                          <i class="icon_piechart"></i>
                          <span>Gerar Relatórios</span>
                          
                      </a>
                                         
                  </li>                 
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_cog"></i>
                          <span>Gerenciar Usuários</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="listaDeClientes.jsp">Clientes</a></li>
                          <li><a class="" href="listaDeTecnicos.jsp">Técnicos</a></li>
                          <li><a class="" href="listaDeAdmin.jsp">Administradores</a></li>                          
                      </ul>
                  </li>   
                                                                                                   
                  
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
    <!--main content start-->
    <section id="main-content">
    	<section class="wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-table"></i> Ordem de Serviço</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="indexAdmin.jsp">Home</a></li>
						<li><i class="icon_document_alt"></i>Meus Chamados</li>
						<li><i class="fa fa-file-text-o"></i>Visualizar</li>
					</ol>
				</div>
			</div>
              <!-- page start-->
                  <div class="col-lg-12">
                  	<section class="panel">
                  		<header class="panel-heading">
                              Ordem de Serviço
                        </header>
                        
                       
                        
                     	<div class="panel-body">
                     		<form class="form-group" action="">
                            	<div class="form-group">
                                    <div class="col-lg-9">                 
                                    	<label class="control-label col-lg-13" ><b>Nome:</b></label>
                                    	<label class="control-label col-lg-13"> <% out.println(request.getParameter("idTecnico"));%> </label> 
                                       	<label id="moveLeft" class="control-label col-lg-13"><b>Assunto:</b></label>
                                    	<label class="control-label col-lg-13"> <% out.println(request.getParameter("assunto")); %> </label>	 
                                   	</div>
                                 </div>
                                 <div class="form-group">
                                    <div class="col-lg-9">
	                                	<label id="moveLine"class="control-label col-lg-13"><b>Data de Abertura:</b></label>
                                        <label class="control-label col-lg-13"> <% out.println(request.getParameter("dataAbertura")); %> </label>
	                                	
                                        <label id="moveLeft" class="control-label col-lg-13"><b>Prazo de Conclusão:</b></label> 
	                                    <label class="control-label col-lg-13"> <% out.println(request.getParameter("prazoConclusao")); %> </label>       
                                 	 </div>
                                  </div>
                                  <div class="form-group">
                                     <div class="col-lg-9">
	                                 	<label id="moveLine"class="control-label col-lg-13"><b>Situação:</b></label>
		                                    <label class="control-label col-lg-13"> <% out.println(request.getParameter("status")); %> </label>
	                                        <label id="moveLeft" class="control-label col-lg-13"><b>Categoria:</b></label>
	                                        <label class="control-label col-lg-13"> <% out.println(request.getParameter("categoria")); %> </label>
	                                         
	                                   		<label id="moveLeft" class="control-label col-lg-13"><b>Prioridade:</b></label>   
                                        	<label class="control-label col-lg-13"> <% if(request.getParameter("prioridade").equals("1")){ 
                                        													out.println("Urgente");
                                        											   }else if(request.getParameter("prioridade").equals("2")){
                                        												   out.println("Alta");
                                        											   }else if(request.getParameter("prioridade").equals("3")){
                                        												   out.println("Média");
                                        											   }else if(request.getParameter("prioridade").equals("4")){
                                        												   out.println("Baixa");
                                        											   }
                                        											%> 
                                        	</label>
	 								  	</div>
	 						      	</div>
	 						      </form>
                                  <div class="form-group">
                                 	  <div class="col-lg-9">
		                                 <label  id="moveLine" class="control-label col-lg-13"><b>Descrição:</b></label>   
                              			 <textarea class="form-control " name="descricao" readonly> <% out.println(request.getParameter("descricao")); %> </textarea>
                              			 
	                                   </div>
								   </div>
								   <div class="form-group">
                                    <div class="col-lg-9" align="justify">
                                        <label id="moveLine" class="control-label col-lg-13"><b>Histórico</b></label>
                                        <div align="justify">
                                        	<table border=1>
                                        		<tr>
	                                        		<td width=150><b>Data</b></td>
	                                        		<td width=500><b>Informações</b></td>
	                                        	</tr>
	                                        	<%  Servicos servicos = new Servicos();
	                                        		List<Historico> list = servicos.getHistoricoChamado(Integer.parseInt(request.getParameter("idChamado")));
	                                        		for(Historico h : list){ %>
	                                        			<tr>
	                                        				<td width=150><%= h.getData()%></td>
	                                        				<td width=500><%= h.getInformacoes()%></td>
	                                        			</tr>
	                                        	<% 	}
	                                            %>
                                        	</table>
                                        </div>
                                        <div class="btn-group" id="moveLeft-btn">
	                                     	<form action="aceitarTransferencia.jsp" method="post">
                                            		<input type="hidden" value="<%= request.getParameter("status")%>" name="status">
                                            		<input type="hidden" value="<%= request.getParameter("assunto")%>" name="assunto">
                                            		<input type="hidden" value="<%= request.getParameter("dataAbertura")%>" name="dataAbertura">
													<input type="hidden" value="<%= request.getParameter("prazoAtendimento")%>" name="prazoAtendimento" />
													<input type="hidden" value="<%= request.getParameter("prazoConclusao")%>" name="prazoConclusao" />
													<input type="hidden" value="<%= request.getParameter("categoria")%>" name="categoria">
													<input type="hidden" value="<%= request.getParameter("prioridade")%>" name="prioridade">
													<input type="hidden" value="<%= request.getParameter("descricao")%>" name="descricao">
													<input type="hidden" value="<%= request.getParameter("atendimentoAtrasado")%>" name="atendimentoAtrasado" />
													<input type="hidden" value="<%= Integer.parseInt(request.getParameter("idChamado"))%>" name="idChamado">
													<input type="hidden" value="<%= request.getParameter("idCliente")%>" name="idCliente">
													<input type="hidden" value="<%= request.getParameter("idTecnico")%>" name="idTecnico">
													<input type="hidden" value="<%= request.getParameter("idTecnicoTransf")%>" name="idTecnicoTransf">
													<button class="btn btn-success" type="submit" data-toggle="modal" data-target="#myModal" >
														Aceitar
														<i class ="icon_check_alt2"></i>
												    </button>
											</form>
	                                   	 </div>
                                    </div>
                                  </div>
								</div>  
                              </div>
                      </section>
                  </section>
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
