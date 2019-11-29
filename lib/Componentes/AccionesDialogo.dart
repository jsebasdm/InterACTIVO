// Librerías
import 'package:flutter/material.dart';

// Clase
class AccionesDialogo extends StatelessWidget {
  // Atributos
  final String nombreBoton;
  final Color colorBoton;
  final Function funcionBoton;

  // Constructor
  AccionesDialogo({this.nombreBoton, this.colorBoton, this.funcionBoton});

  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    // Forma Botones
    final forma = RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));

    // Método Cerrar Diálogo
    void cerrarDialogo() => Navigator.of(contexto).pop();

    // Método Botón Principal
    void clickBoton() {
      cerrarDialogo();
      funcionBoton();
    }

    // Botón Principal
    final botonPrincipal = RaisedButton(
        child: Text(nombreBoton), color: colorBoton, textColor: Colors.white, onPressed: clickBoton, shape: forma);

    // Botón Cancelar
    final botonCancelar = OutlineButton(
      child: Text('Cancelar'), textColor: Colors.grey[700], onPressed: cerrarDialogo, shape: forma);

    // Unión Botones Diálogo
    return Row(children: [botonCancelar, SizedBox(width: 10), botonPrincipal, SizedBox(width: 10)]);
  }
}
