package model;

import java.time.LocalDate;

public class Chamado {

	private int idChamado;
	private String descricao;
	private String assunto;
	private String status;
	private String prioridade;
	private String categoria;
	private String atendimentoAtrasado;
	private LocalDate dataAbertura;
	private LocalDate prazoAtendimento;
	private LocalDate prazoConclusao;
	private String idCliente; //Chave estrangeira
	private String idTecnico; //Chave estrangeira
	private String idTecnicoTransf; //Chave estrangeira
	
	public int getIdChamado() {
		return idChamado;
	}
	public void setIdChamado(int idChamado) {
		this.idChamado = idChamado;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPrioridade() {
		return prioridade;
	}
	public void setPrioridade(String prioridade) {
		this.prioridade = prioridade;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	public String getAtendimentoAtrasado() {
		return atendimentoAtrasado;
	}
	public void setAtendimentoAtrasado(String atendimentoAtrasado) {
		this.atendimentoAtrasado = atendimentoAtrasado;
	}
	public LocalDate getDataAbertura() {
		return dataAbertura;
	}
	public void setDataAbertura(LocalDate dataAbertura) {
		this.dataAbertura = dataAbertura;
	}
	public LocalDate getPrazoAtendimento() {
		return prazoAtendimento;
	}
	public void setPrazoAtendimento(LocalDate prazoAtendimento) {
		this.prazoAtendimento = prazoAtendimento;
	}
	public LocalDate getPrazoConclusao() {
		return prazoConclusao;
	}
	public void setPrazoConclusao(LocalDate prazoConclusao) {
		this.prazoConclusao = prazoConclusao;
	}
	public String getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(String idCliente) {
		this.idCliente = idCliente;
	}
	public String getIdTecnico() {
		return idTecnico;
	}
	public void setIdTecnico(String idTecnico) {
		this.idTecnico = idTecnico;
	}
	public String getAssunto() {
		return assunto;
	}
	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}
	public String getIdTecnicoTransf() {
		return idTecnicoTransf;
	}
	public void setIdTecnicoTransf(String idTecnicoTransf) {
		this.idTecnicoTransf = idTecnicoTransf;
	}
}