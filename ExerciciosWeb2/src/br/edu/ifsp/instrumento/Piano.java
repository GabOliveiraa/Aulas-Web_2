package br.edu.ifsp.instrumento;

import javax.swing.JOptionPane;

public class Piano implements Instrumento {
    @Override
    public void tocar() {
        JOptionPane.showMessageDialog(null, "Piano tocando: *plim plim plim*");
    }
}
