package br.edu.ifspcjo.ads.cjoweb2.project4.model;

public class LoginService {
	public boolean authenticate(String email, String password) {
		if(email == null || password == null) {
			return false;
		}
		
		if(email.equals("aluno@ifsp.edu.br") && password.equals("1234")) {
			return true;
		}else {
			return false;
		}
	}
}
