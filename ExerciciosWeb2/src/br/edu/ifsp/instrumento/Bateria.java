package br.edu.ifsp.instrumento;

import javax.swing.JOptionPane;

public class Bateria implements Instrumento {
	    @Override
	    public void tocar() {
	        JOptionPane.showMessageDialog(null, "Bateria tocando: *tum pá tum tum pá*");
	    }
}
