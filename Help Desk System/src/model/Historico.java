package model;

import java.time.LocalDate;

public class Historico {
	
	private int idHistorico;
	private LocalDate data;
	private String informacoes;
	private int idChamado; //Chave estrangeira

	public int getIdHistorico() {
		return idHistorico;
	}
	public void setIdHistorico(int idHistorico) {
		this.idHistorico = idHistorico;
	}
	public LocalDate getData() {
		return data;
	}
	public void setData(LocalDate data) {
		this.data = data;
	}
	public String getInformacoes() {
		return informacoes;
	}
	public void setInformacoes(String informacoes) {
		this.informacoes = informacoes;
	}
	public int getIdChamado() {
		return idChamado;
	}
	public void setIdChamado(int idChamado) {
		this.idChamado = idChamado;
	}
}
