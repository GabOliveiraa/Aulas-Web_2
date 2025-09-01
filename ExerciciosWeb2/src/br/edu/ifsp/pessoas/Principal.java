package br.edu.ifsp.pessoas;

public class Principal {
	public static void main(String[] args) {
		Endereco e1 = new Endereco("Rua Nossa Senhora Aparecida", "265", "Fracalanza", "Campos do Jordão");
		Endereco e2 = new Endereco("Av. Dr. januário miraglia", "4322", "Abernécia", "Campos do Jordão");
		
		PessoaFisica pf = new PessoaFisica("Carlos", "Silva", e1, "843.529.378-42");
		PessoaJuridica pj = new PessoaJuridica("12.345.678/0001-90", e2);
		
		System.out.println("Pessoa Fisica");
		System.out.println(pf);
		
		System.out.println("\nPessoa Juridica");
		System.out.println(pj);
	}
}
