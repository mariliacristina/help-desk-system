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

   <title> Sistema HelpDesk</title>

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
    <link rel="stylesheet" type="text/css" href="css/daterangepicker.css" />

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
            <a href="indexCliente.jsp" class="logo">Help <span class="lite">Desk</span></a>
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
							<li><a class="" href="chamadosDoTecnicoConcluidos.jsp">Concluídos</a></li>
							<!--<li><a class="" href="grids.html">Grids</a></li> -->
						</ul></li>
					<li><a class="" href="transferenciasTecnico.jsp"> <i
							class="icon_cloud-download"></i> <span>Transferências</span>
					</a></li>
					<li><a class="" href="estatisticasTecnico.jsp"> <i
							class="icon_piechart"></i> <span>Estatísticas</span>

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
					<h3 class="page-header"><i class="icon_piechart"></i> Estatísticas</h3>
					<ol class="breadcrumb">					
						<li><i class="icon_piechart"></i>Estatísticas</li>
						
					</ol>
				</div>
			</div>
            <div class="row">
              <div class="col-lg-12">
                  <section class="panel">
                      <header class="panel-heading">
                          <h3>Gerar Relatório</Char>
                      </header>
                      <div class="panel-body">
                        <div class="tab-pane" id="chartjs">
                            <div class="row"> 
                                <div class="col-lg-6">
                                    <h4> PerÃ­odo </h4>
                                </div>
                            </div>  
                            <div class="row"> 
                                <div class="col-lg-4">
                                    <div class="input-group mini">
                                        <div class="input-group-addon">  
                                            <span class="glyphicon glyphicon-calendar fa fa-calendar" ></span>                             
                                        </div>                                                                         
                                                                                                                                                                                           
                                            <input class="form-control"type="text" name="daterange" value="01/01/2015 - 01/31/2015" >
                                    </div>                                                                                
                                </div>
                                <div class="col-md-4 col-md-offset demo">
                                	<form action = "gerarRelatorioTecnico.jsp" method = "post">
                                        <button class="btn btn-primary" onclick="if(document.getElementById('relat') .style.display=='none') {document.getElementById('relat') .style.display=''}else{document.getElementById('relat') .style.display='none'}"type="submit" >Gerar Relatório</button>
                                        <input type="hidden" value="<%= usuario.getEmailUsuario()%>" name="idTecnico">
                                        <button class="btn btn-success" type="submit">Gerar PDF</button>
                                    </form>
                                 </div>                                                                      
                            </div>                                                            
                            
                            
                            <div class="col-lg-6"id="relat"style="display:none">                                                  
                                  <div class="panel-body">
                                    <header class="panel-heading">
                                            <h3>Chamados atendidos</Char>
                                     </header>
                                      <canvas id="relatorio"height="300" width="450"></canvas>                                                                                                      
                          
                            
                            </div>
                            
                            </div>
                         
                                 
                            
                                                                                                            
                        </div>                        
                      </div>                         
                  </section>
              </div>
            </div>       
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
                <a href="https://bootstrapmade.com/free-business-bootstrap-themes-website-templates/">Business Bootstrap Themes</a> by <a href="https://bootstrapmade.com/">BootstrapMade</a>
            </div>
        </div>
    </section>
    <!-- container section end -->
    <!-- javascripts -->
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

     
    <script type="text/javascript" src="js/moment.min.js"></script>
    <script type="text/javascript" src="js/daterangepicker.js"></script>
    
    <script>
    $('input[name="daterange"]').daterangepicker(
        {
        "locale": {
        "direction": "ltr",
        "format": "MM/DD/YYYY",
        "separator": " - ",
        "applyLabel": "Aplicar",
        "cancelLabel": "Cancelar",
        "fromLabel": "From",
        "toLabel": "To",
        "customRangeLabel": "Custom",
        "daysOfWeek": [
            "Dom",
            "Seg",
            "Ter",
            "Qua",
            "Qui",
            "Sex",
            "Sab"
        ],
        "monthNames": [
            "Janeiro",
            "Fevereiro",
            "MarÃ§o",
            "Abril",
            "Maio",
            "Junho",
            "Julho",
            "Agosto",
            "Setembro",
            "Outubro",
            "Novembro",
            "Dezembro"
        ],
        "firstDay": 1
    },
    "startDate": "05/16/2017",
    "endDate": "05/22/2017",
    "opens": "rigth"
}, function(start, end, label) {
  console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
});

    $(function () {
        var data = {
        labels: ["Domingo", "Segunda", "TerÃ§a", "Quarta", "Quinta", "Sexta", "SÃ¡bado"],
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
        var ctx = document.getElementById("relatorio").getContext('2d');
        var myLineChart = new Chart(ctx).Line(data, option); //'Line' defines type of the chart.
    });
    </script>

  </body>
</html>
