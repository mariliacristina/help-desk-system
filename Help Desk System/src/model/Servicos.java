package model;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.time.LocalDate;
import java.util.List;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;


public class Servicos {

	private DAOChamado daoChamado;
	private DAOHistorico daoHistorico;
	private DAOUsuario daoUsuario;

	public Servicos(){

		this.daoChamado = new DAOChamado();
		this.daoHistorico = new DAOHistorico();
		this.daoUsuario = new DAOUsuario();
	}

	/** Funções para manipulação de Usuário */

	public void cadastrarUsuario(Usuario usuario) throws RuntimeException {

		daoUsuario.create(usuario);
	}

	public void atualizarInformacoesUsuario(Usuario usuario) throws RuntimeException {

		daoUsuario.update(usuario);
	}

	public void excluirConta(Usuario usuario) throws RuntimeException {

		daoUsuario.delete(usuario);
	}

	public Usuario getInfUsuario(String email) throws RuntimeException {

		return daoUsuario.getUsuario(email);
	}

	public List<Usuario> getListaUsuarios() throws RuntimeException {
		return daoUsuario.read();
	}

	public List<Usuario> getListaClientes() throws RuntimeException {
		return daoUsuario.getListaClientes();
	}

	public List<Usuario> getListaTecnicos() throws RuntimeException {
		return daoUsuario.getListaTecnicos();
	}

	public List<Usuario> getListaAdmin() throws RuntimeException {
		return daoUsuario.getListaAdmin();
	}

	public void setNivelAcesso(String emailUsuario, String nivelAcesso) throws RuntimeException {
		daoUsuario.setNivelAcesso(emailUsuario, nivelAcesso);
	}

	/** Funções para manipulação de Chamado */

	public void abrirChamado(Chamado chamado) throws RuntimeException {

		daoChamado.create(chamado);
	}

	public void atualizarInformacoesChamado(Chamado chamado) throws RuntimeException {

		daoChamado.update(chamado);
	}

	public int obterIdChamado() throws RuntimeException {

		return daoChamado.getIdChamado();
	}

	public void cancelarChamado(Chamado chamado) throws RuntimeException {

		daoChamado.update(chamado);
	}

	public void fecharChamado(Chamado chamado) throws RuntimeException {

		daoChamado.update(chamado);
	}

	public void transferirChamado(Chamado chamado) throws RuntimeException {

		daoChamado.update(chamado);
	}

	public List<Chamado> getListaChamados() throws RuntimeException {
		return daoChamado.read();
	}

	public List<Chamado> getChamadoCliente(String email) throws RuntimeException {
		return daoChamado.getChamadoCliente(email);
	}

	public List<Chamado> getChamadoTecnico(String email) throws RuntimeException {
		return daoChamado.getChamadoTecnico(email);
	}

	public List<Chamado> getChamadosTransferidos(String idTecnicoTransf) throws RuntimeException {
		return daoChamado.getChamadosTransferidos(idTecnicoTransf);
	}

	public Chamado obterChamado(){

		return daoChamado.obterChamado();
	}

	public List<Chamado> obterChamadosAtrasados(){

		return daoChamado.getChamadosAtrasados();
	}

	/** Funções para manipulação de Histórico */

	public List<Historico> getHistoricoChamado(int idChamado){
		return daoHistorico.getHistoricoChamado(idChamado);
	}

	public void criarHistorico(Historico historico) throws RuntimeException {

		daoHistorico.create(historico);
	}

	public void atualizarHistorico(Historico historico) throws RuntimeException {

		daoHistorico.update(historico);
	}

	public List<Historico> getListaHistoricos() throws RuntimeException {
		return daoHistorico.read();
	}

	/**
	 * Outros
	 */

	public void gerarRelatorioPorCategoria(){

		Document doc = null;
		OutputStream os = null;

		try{
			doc = new Document(PageSize.A4, 72, 72, 72, 72);
			os = new FileOutputStream("relatorio.pdf");
			PdfWriter.getInstance(doc, os);
			doc.open();

			Font f = new Font(FontFamily.TIMES_ROMAN, 20, Font.BOLD);
			Paragraph titulo = new Paragraph("Relatório de Chamados por Categoria", f);
			titulo.setAlignment(Element.ALIGN_CENTER);
			titulo.setSpacingAfter(20);
			doc.add(titulo);

			PdfPTable table = new PdfPTable(new float[] {0.8f, 0.2f});
			PdfPCell header = new PdfPCell(new Paragraph(LocalDate.now().toString()));
			header.setColspan(2);
			header.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(header);
			table.addCell("Quantidade de Chamados da Categoria Dúvida");
			table.addCell(""  + daoChamado.getQtdChamadosCategoria("Duvida"));
			table.addCell("Quantidade de Chamados da Categoria Instalação");
			table.addCell("" + daoChamado.getQtdChamadosCategoria("Instalacao"));
			table.addCell("Quantidade de Chamados da Categoria Problema");
			table.addCell("" + daoChamado.getQtdChamadosCategoria("Problema"));
			table.addCell("Quantidade de Chamados da Categoria Não Especificada");
			table.addCell("" + daoChamado.getQtdChamadosCategoria("Nao Especificada"));
			doc.add(table);

		}catch (FileNotFoundException e) {
			// TODO: handle exception
		}catch (DocumentException e) {
			// TODO: handle exception
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(doc != null){
				doc.close();
			}
		}
	}

	public void gerarRelatorioTecnico(String idTecnico){
		
		Usuario usuario = daoUsuario.getUsuario(idTecnico);
		Document doc = null;
		OutputStream os = null;

		try{
			doc = new Document(PageSize.A4, 72, 72, 72, 72);
			os = new FileOutputStream("relatorio.pdf");
			PdfWriter.getInstance(doc, os);
			doc.open();

			Font f = new Font(FontFamily.TIMES_ROMAN, 20, Font.BOLD);
			Paragraph titulo = new Paragraph("Relatório Geral dos Chamados\n " + "Técnico: " + usuario.getNome(), f);
			titulo.setAlignment(Element.ALIGN_CENTER);
			titulo.setSpacingAfter(20);
			doc.add(titulo);

			PdfPTable table = new PdfPTable(new float[] {0.8f, 0.2f});
			PdfPCell header = new PdfPCell(new Paragraph(LocalDate.now().minusDays(30).toString() + "  -  " + LocalDate.now().toString()));
			header.setColspan(2);
			header.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(header);
			table.addCell("Quantidade de chamados concluídos e atendidos dentro do prazo");
			table.addCell(""  + daoChamado.getQtdChamadosTecnicoConcPrazo(idTecnico));
			table.addCell("Quantidade de chamados concluídos fora do prazo e atendidos no prazo");
			table.addCell("" + daoChamado.getQtdChamadosTecnicoForaPrazo(idTecnico));
			table.addCell("Quantidade de chamados concluídos dentro do prazo e atendidos fora do prazo");
			table.addCell("" + daoChamado.getQtdChamadosTecnicoDentroPrazoForaAtend(idTecnico));
			table.addCell("Quantidade de chamados concluídos e atendidos fora do prazo");
			table.addCell("" + daoChamado.getQtdChamadosTecnicoForaPrazoForaAtend(idTecnico));
			table.addCell("Quantidade de chamados cancelados");
			table.addCell("" + daoChamado.getQtdChamadosTecnicoCancelados(idTecnico));
			doc.add(table);

		}catch (FileNotFoundException e) {
			// TODO: handle exception
		}catch (DocumentException e) {
			// TODO: handle exception
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(doc != null){
				doc.close();
			}
		}
	}
	
	public void gerarRelatorioGeral(){

		Document doc = null;
		OutputStream os = null;

		try{
			doc = new Document(PageSize.A4, 72, 72, 72, 72);
			os = new FileOutputStream("relatorio.pdf");
			PdfWriter.getInstance(doc, os);
			doc.open();

			Font f = new Font(FontFamily.TIMES_ROMAN, 20, Font.BOLD);
			Paragraph titulo = new Paragraph("Relatório Geral dos Chamados", f);
			titulo.setAlignment(Element.ALIGN_CENTER);
			titulo.setSpacingAfter(20);
			doc.add(titulo);

			PdfPTable table = new PdfPTable(new float[] {0.8f, 0.2f});
			PdfPCell header = new PdfPCell(new Paragraph(LocalDate.now().minusDays(30).toString() + "  -  " + LocalDate.now().toString()));
			header.setColspan(2);
			header.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(header);
			table.addCell("Quantidade de chamados concluídos e atendidos dentro do prazo");
			table.addCell(""  + daoChamado.getQtdTotalChamadosConcPrazo());
			table.addCell("Quantidade de chamados concluídos fora do prazo e atendidos no prazo");
			table.addCell("" + daoChamado.getQtdTotalChamadosForaPrazo());
			table.addCell("Quantidade de chamados concluídos dentro do prazo e atendidos fora do prazo");
			table.addCell("" + daoChamado.getQtdTotalChamadosDentroPrazoForaAtend());
			table.addCell("Quantidade de chamados concluídos e atendidos fora do prazo");
			table.addCell("" + daoChamado.getQtdTotalChamadosForaPrazoForaAtend());
			table.addCell("Quantidade de chamados cancelados");
			table.addCell("" + daoChamado.getQtdTotalDeChamadosCancelados());
			doc.add(table);

		}catch (FileNotFoundException e) {
			// TODO: handle exception
		}catch (DocumentException e) {
			// TODO: handle exception
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(doc != null){
				doc.close();
			}
		}
	}
	
	public void gerarRelatorioUsuarios(){

		Document doc = null;
		OutputStream os = null;

		try{
			doc = new Document(PageSize.A4, 72, 72, 72, 72);
			os = new FileOutputStream("relatorio.pdf");
			PdfWriter.getInstance(doc, os);
			doc.open();

			Font f = new Font(FontFamily.TIMES_ROMAN, 20, Font.BOLD);
			Paragraph titulo = new Paragraph("Relatório Geral dos Usuários do Sistema", f);
			titulo.setAlignment(Element.ALIGN_CENTER);
			titulo.setSpacingAfter(20);
			doc.add(titulo);

			PdfPTable table = new PdfPTable(new float[] {0.8f, 0.2f});
			PdfPCell header = new PdfPCell(new Paragraph(LocalDate.now().toString()));
			header.setColspan(2);
			header.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(header);
			table.addCell("Quantidade total de clientes");
			table.addCell(""  + daoChamado.getQtdEnvolvidos("Cliente"));
			table.addCell("Quantidade total de técnicos");
			table.addCell(""  + daoChamado.getQtdEnvolvidos("Tecnico"));
			table.addCell("Quantidade total de administradores");
			table.addCell(""  + daoChamado.getQtdEnvolvidos("Administrador"));
			doc.add(table);

		}catch (FileNotFoundException e) {
			// TODO: handle exception
		}catch (DocumentException e) {
			// TODO: handle exception
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(doc != null){
				doc.close();
			}
		}
	}
	

	/*
	public void gerarRelatorioPorCategoria(){

		Document doc = null;
		OutputStream os = null;

		try{
			doc = new Document(PageSize.A4, 72, 72, 72, 72);
			os = new FileOutputStream("relatorio.pdf");
			PdfWriter.getInstance(doc, os);
			doc.open();

			Font f = new Font(FontFamily.TIMES_ROMAN, 20, Font.BOLD);
			Paragraph titulo = new Paragraph("Relatório Geral dos Chamados por", f);
			titulo.setAlignment(Element.ALIGN_CENTER);
			titulo.setSpacingAfter(20);
			doc.add(titulo);

			PdfPTable table = new PdfPTable(new float[] {0.8f, 0.2f});
			PdfPCell header = new PdfPCell(new Paragraph(this.periodo.toString() + "  -  " + LocalDate.now().toString()));
			header.setColspan(2);
			table.addCell(header);
			table.addCell("Quantidade de chamados total");
			table.addCell(""  + this.qtdChamTotal);
			table.addCell("Quantidade de chamados atendidos no prazo");
			table.addCell("" + this.qtdChamAtendPrazo);
			table.addCell("Quantidade de chamados atendidos fora do prazo");
			table.addCell("" + this.qtdChamAtendForaPrazo);
			table.addCell("Quantidade de chamados não atendidos");
			table.addCell("" + this.qtdChamNaoAtend);
			doc.add(table);

		}catch (FileNotFoundException e) {
			// TODO: handle exception
		}catch (DocumentException e) {
			// TODO: handle exception
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(doc != null){
				doc.close();
			}
		}
	}
	 */
	
	
	public void enviarEmail(String email, String msg){
		try{
			Email email1 = new SimpleEmail();
			email1.setHostName("smtp.gmail.com");
			email1.setSmtpPort(465);
			email1.setAuthenticator(new DefaultAuthenticator("sistemahelpdesk01@gmail.com", "sistemahelpdesk")); 
			email1.setSSLOnConnect(true);
			email1.setDebug(true);
			email1.addTo(email);
			email1.setFrom("sistemahelpdesk01@gmail.com", "Sistema Help Desk");
			email1.setSubject("Atualização sobre andamento do chamado");
			email1.setMsg(msg); 
			email1.send();
		}catch (EmailException e) {
			// TODO: handle exception
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}

}