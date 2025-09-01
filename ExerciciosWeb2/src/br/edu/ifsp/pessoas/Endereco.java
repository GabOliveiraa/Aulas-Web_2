package br.edu.ifsp.pessoas;

public class Endereco {
	private String logradouro;
	private String numero;
	private String bairro;
	private String cidade;
	
	public Endereco(String logradouro, String numero, String bairro, String cidade) {
		this.logradouro = logradouro;
		this.numero = numero;
		this.bairro = bairro;
		this.cidade = cidade;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	
	@Override
	public String toString() {
		return "Endereço: " + logradouro + ", numero: " + numero + ", bairro: " + bairro + ", cidade: " + cidade;
	}
}
