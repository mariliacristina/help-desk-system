<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Usuario"%>
<%@ page import="model.Servicos"%>
<%@ page import="model.Historico"%>
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
    <!-- full calendar css-->
    <link href="assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
	<link href="assets/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" />
    <!-- easy pie chart-->
    <link href="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
    <!-- owl carousel -->
    <link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
	<link href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
    <!-- Custom styles -->
	<link rel="stylesheet" href="css/fullcalendar.css">
	<link href="css/widgets.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
	<link href="css/xcharts.min.css" rel=" stylesheet">	
	<link href="css/jquery-ui-1.10.4.min.css" rel="stylesheet">
    <!-- =======================================================
        Theme Name: NiceAdmin
        Theme URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
        Author: BootstrapMade
        Author URL: https://bootstrapmade.com
    ======================================================= -->
  </head>

  <body>
  
  
        <% Usuario usuario = (Usuario) session.getAttribute("usuario"); 
        %>
  <!-- container section start -->
  <section id="container" class="">
     
      
      <header class="header dark-bg">
            <div class="toggle-nav">
                <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"><i class="icon_menu"></i></div>
            </div>

            <!--logo start-->
            <a href="indexAdm.jsp" class="logo">Help<span class="lite">Desk</span></a>
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
      <!--sidebar end-->
      
          <!--main content start-->
    <section id="main-content">
    	<section class="wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-table"></i> Ordem de Serviço</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="indexAdm.jsp">Home</a></li>
						<li><i class="icon_document_alt"></i>Chamados Abertos</li>
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
                                    	<label class="control-label col-lg-13"> <%= usuario.getNome() %> </label> 
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
                                        	<label id="moveLeft" class="control-label col-lg-13"><b>Técnico Responsável:</b></label>   
                                        	<label class="control-label col-lg-13"> 
                                        		<% if(request.getParameter("idTecnico") != null){ 
                                        				out.println(request.getParameter("idTecnico"));
                                        		   }
                                        		%> 
                                           </label>
	 								  </div>
	 						      </div> </form>
	 						      
                                  <!-- Inicio Modal Editar descricao -->
                                  <div class="form-group">
                                 	  <div class="col-lg-9">
		                                 <label  id="moveLine" class="control-label col-lg-13"><b>Descrição:</b></label>   
                              			 <textarea class="form-control " name="descricao" readonly> <% out.println(request.getParameter("descricao")); %> </textarea>
                              			 <div class="btn-group">
                              			 	<div id="moveLine">
	                                     		<button type="button" id="color-btn" class="btn btn-default" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Editar descrição</button>
	                                     		
	                                     	</div>
	                                     </div>
	                                     <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
										  		<div class="modal-dialog" role="document">
										    		<div class="modal-content">
										      			<div class="modal-header">
										        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										        			<h4 class="modal-title" id="exampleModalLabel">Descreva o chamado</h4>
										      			</div>
										      			<div class="modal-body">
										        			<form action = "editarDescricao.jsp" method = "post">
										          				<div class="form-group">
										            				<label for="message-text" class="control-label">Descrição:</label>
										            				<textarea class="form-control" id="message-text" name = "descricaoEditada"></textarea>
										          				</div>
										          			   <input type="hidden" value="<%= request.getParameter("status")%>" name="status" />
					                                           <input type="hidden" value="<%= request.getParameter("assunto")%>" name="assunto" />
					                                           <input type="hidden" value="<%= request.getParameter("dataAbertura")%>" name="dataAbertura" />
					                                           <input type="hidden" value="<%= request.getParameter("prazoAtendimento")%>" name="prazoAtendimento" />
					                                           <input type="hidden" value="<%= request.getParameter("prazoConclusao")%>" name="prazoConclusao" />
															   <input type="hidden" value="<%= request.getParameter("categoria")%>" name="categoria" />
															   <input type="hidden" value="<%= request.getParameter("prioridade")%>" name="prioridade" />
															   <input type="hidden" value="<%= request.getParameter("descricao")%>" name="descricao" />
															   <input type="hidden" value="<%= request.getParameter("atendimentoAtrasado")%>" name="atendimentoAtrasado" />
															   <input type="hidden" value="<%= Integer.parseInt(request.getParameter("idChamado"))%>" name="idChamado" />
															   <input type="hidden" value="<%= request.getParameter("idCliente")%>" name="idCliente" />
															   <input type="hidden" value="<%= request.getParameter("idTecnico")%>" name="idTecnico" />
															   <input type="hidden" value="<%= request.getParameter("idTecnicoTransf")%>" name="idTecnicoTransf" />
										        	  		
										      			
										      			<div class="modal-footer">
										        			<button type="submit" class="btn btn-primary">Salvar </button>
										        			<button type="button" class="btn btn-default" data-dismiss="modal">Sair </button>
										      			</div>
										      			</form>
										      			</div>
										    		</div>
										  		</div>
											</div> 
                              			</div>
                              		</div>
                              		<!-- Fim Modal Editar descricao -->
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
	                                        		//System.out.println(Integer.parseInt(request.getParameter("idChamado")));
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
                                     </div>
                                  </div>
                     		</form>
                     	</div>
                  	</section>
                  </div>
              </section>        
  		  </section>   
  </section>                   
                          

    <!-- javascripts -->
    <script src="js/jquery.js"></script>
	<script src="js/jquery-ui-1.10.4.min.js"></script>
    <script src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
    <!-- bootstrap -->
    <script src="js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <!-- charts scripts -->
    <script src="assets/jquery-knob/js/jquery.knob.js"></script>
    <script src="js/jquery.sparkline.js" type="text/javascript"></script>
    <script src="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
    <script src="js/owl.carousel.js" ></script>
    <!-- jQuery full calendar -->
    <<script src="js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
	<script src="assets/fullcalendar/fullcalendar/fullcalendar.js"></script>
    <!--script for this page only-->
    <script src="js/calendar-custom.js"></script>
	<script src="js/jquery.rateit.min.js"></script>
    <!-- custom select -->
    <script src="js/jquery.customSelect.min.js" ></script>
	<script src="assets/chart-master/Chart.js"></script>
   
    <!--custome script for all page-->
    <script src="js/scripts.js"></script>
    <!-- custom script for this page-->
    <script src="js/sparkline-chart.js"></script>
    <script src="js/easy-pie-chart.js"></script>
	<script src="js/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="js/jquery-jvectormap-world-mill-en.js"></script>
	<script src="js/xcharts.min.js"></script>
	<script src="js/jquery.autosize.min.js"></script>
	<script src="js/jquery.placeholder.min.js"></script>
	<script src="js/gdp-data.js"></script>	
	<script src="js/morris.min.js"></script>
	<script src="js/sparklines.js"></script>	
	<script src="js/charts.js"></script>
	<script src="js/jquery.slimscroll.min.js"></script>
  <script>

      //knob
      $(function() {
        $(".knob").knob({
          'draw' : function () { 
            $(this.i).val(this.cv + '%')
          }
        })
      });

      //carousel
      $(document).ready(function() {
          $("#owl-slider").owlCarousel({
              navigation : true,
              slideSpeed : 300,
              paginationSpeed : 400,
              singleItem : true

          });
      });

      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });
	  
	  /* ---------- Map ---------- */
	$(function(){
	  $('#map').vectorMap({
	    map: 'world_mill_en',
	    series: {
	      regions: [{
	        values: gdpData,
	        scale: ['#000', '#000'],
	        normalizeFunction: 'polynomial'
	      }]
	    },
		backgroundColor: '#eef3f7',
	    onLabelShow: function(e, el, code){
	      el.html(el.html()+' (GDP - '+gdpData[code]+')');
	    }
	  });
	});
	
	$(function () {
        var data = {
        labels: ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"],
        datasets: [            
            {
                label: "My Second dataset",
                fillColor: "rgba(151,187,205,0.2)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(151,187,205,1)",
                data: [0, 48, 40, 19, 86, 27, 90]
            }
            ]
        };
   
        var option = {
        responsive: true,
        };
   
        // Get the context of the canvas element we want to select
        var ctx = document.getElementById("recebidos").getContext('2d');
        var myLineChart = new Chart(ctx).Line(data, option); //'Line' defines type of the chart.
    });
    $(function () {
        var data = {
        labels: ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"],
        datasets: [            
            {
                label: "My First dataset",
                fillColor: "rgba(220,220,220,0.2)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(151,187,205,1)",
                data: [28, 48, 40, 19, 86, 27, 90]
            }
            ]
        };
   
        var option = {
        responsive: true,
        };
   
        // Get the context of the canvas element we want to select
        var ctx = document.getElementById("concluidos").getContext('2d');
        var myLineChart = new Chart(ctx).Line(data, option); //'Line' defines type of the chart.
    });
	    

  </script>

  </body>
</html>
