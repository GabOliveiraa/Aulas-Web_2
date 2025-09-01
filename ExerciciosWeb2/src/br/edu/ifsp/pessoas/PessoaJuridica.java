package br.edu.ifsp.pessoas;

public class PessoaJuridica {
	private String cnpj;
	private Endereco endereco;
	
	public PessoaJuridica(String cnpj, Endereco endereco) {
		this.cnpj = cnpj;
		this.endereco = endereco;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	@Override
	public String toString() {
		return "CNPJ: " + cnpj + "\n" + endereco;
	}
	
}
