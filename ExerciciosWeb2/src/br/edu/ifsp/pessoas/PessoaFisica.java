package br.edu.ifsp.pessoas;

public class PessoaFisica extends Pessoa{
	private String cpf;

	public PessoaFisica(String nome, String sobrenome, Endereco endereco, String cpf) {
		super(nome, sobrenome, endereco);
		this.cpf = cpf;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	@Override
	public String toString() {
		return super.toString() + "\nCPF: " + cpf;
	}
}
