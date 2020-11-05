<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.Usuario" %>
<%@ page import = "model.Chamado" %>
<%@ page import = "model.Servicos" %>
<%@ page import = "model.Historico" %>
<%@ page import = "java.time.LocalDate" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sistema Help Desk</title>
<link href="SweetAlert/sweetalert.css" rel="stylesheet">  
</head>
<body id = "teste">
		<% 
			Usuario usuario = (Usuario) session.getAttribute("usuario");
		
	    	try{
	    			    		
	    		Servicos servicos = new Servicos();
	    		
	    		Chamado chamado = servicos.obterChamado();
	    		
	    		 if (chamado == null){%>
	    		 
	    			<script src="SweetAlert/sweetalert.min.js"></script>
	    			
	    			<script language="javascript">	    				    			    				    		          
	    		                    swal({
	    		                        title: "Oops...",
	    		                        text: "Não há chamados abertos",
	    						        timer: 1000,
	    						        type: "error",
	    						        showConfirmButton: false
	    		                    }, function() {
	    		    					<%	    		    				
	    		    					if(usuario.getNivelAcesso().equals("Tecnico")){%>
	    		    						window.location = "chamadosTecnico.jsp" 
	    		    		    	<%  }else if(usuario.getNivelAcesso().equals("Administrador")){ %>
	    		    		    			window.location ="chamadosAdmin.jsp" 
	    		    					<%}	%>	    		    					
	    		                        
	    		                    });	    		                    	    		         
					</script>
					
	    			

	    	   <%}else{
	    		
					chamado.setIdTecnico(usuario.getEmailUsuario());
					chamado.setStatus("Em Atendimento");
					
					servicos.atualizarInformacoesChamado(chamado);				
				
					Historico historico = new Historico();
					historico.setData(LocalDate.now());
					historico.setInformacoes("O chamado começou a ser atendido");
					historico.setIdChamado(chamado.getIdChamado());
					servicos.criarHistorico(historico);%>
					<script src="SweetAlert/sweetalert.min.js"></script>
	    			
	    			<script language="javascript">	    				    			    				    		          
	    		                    swal({
	    		                        title: "Sucesso !",	    		                  
	    						        timer: 1000,
	    						        type: "success",
	    						        showConfirmButton: false
	    		                    }, function() {
	    		    					<%	    		    				
	    		    					if(usuario.getNivelAcesso().equals("Tecnico")){%>
	    		    						window.location = "chamadosTecnico.jsp" 
	    		    		    	<%  }else if(usuario.getNivelAcesso().equals("Administrador")){ %>
	    		    		    			window.location ="chamadosAdmin.jsp" 
	    		    					<%}	%>	    		    					
	    		                        
	    		                    });	    		                    	    		         
					</script>
				
					
	    <%  }
	    	}catch(RuntimeException e){
	    		
	    		if(usuario.getNivelAcesso().equals("Tecnico")){%>
					<jsp:forward page = "chamadosTecnico.jsp" />
    		<%  }else if(usuario.getNivelAcesso().equals("Administrador")){ %>
					<jsp:forward page = "chamadosAdmin.jsp" />
    		<%  }
	        }
	    %>
	    
</body>
</html> 