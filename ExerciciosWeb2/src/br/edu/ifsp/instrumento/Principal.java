package br.edu.ifsp.instrumento;

import javax.swing.JOptionPane;

public class Principal {
	public static void main(String[] args) {
		String entrada = JOptionPane.showInputDialog("Digite o instrumento: guitarra, bateria ou piano");
		if (entrada == null) return;
		
		String nome = entrada.trim().toLowerCase();
		
		Instrumento inst;
        switch (nome) {
            case "guitarra" -> inst = new Guitarra();
            case "bateria"  -> inst = new Bateria();
            case "piano"    -> inst = new Piano();
            default -> {
                JOptionPane.showMessageDialog(null,
                        "Instrumento inválido.\nUse: guitarra, bateria ou piano.");
                return;
            }
        }

        inst.tocar();
	}
}
