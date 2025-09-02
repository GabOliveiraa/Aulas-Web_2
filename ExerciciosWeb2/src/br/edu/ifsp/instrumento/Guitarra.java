package br.edu.ifsp.instrumento;

import javax.swing.JOptionPane;

public class Guitarra implements Instrumento {
    @Override
    public void tocar() {
        JOptionPane.showMessageDialog(null, "Guitarra tocando: *tchanran tchanran*");
    }
}
