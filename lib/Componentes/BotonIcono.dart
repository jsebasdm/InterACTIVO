// Librerías
import 'package:flutter/material.dart';

// Clase Botón Redondo Ícono
class BotonIcono extends StatelessWidget {
  // Atributos
  final IconData icono;
  final Function clickBoton;
  final double tamagnoIcono;
  final String nombrePista;

  // Constructor
  BotonIcono({this.icono, this.clickBoton, this.nombrePista, this.tamagnoIcono = 30});

  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    final padding = EdgeInsets.all(12);
    final cuerpoIcono = Container(child: Icon(icono, color: Colors.white, size: tamagnoIcono), padding: padding);
    final forma = CircleBorder();
    final pistaBoton = Tooltip(message: nombrePista, child: cuerpoIcono);
    return RawMaterialButton(child: pistaBoton, shape: forma, constraints: BoxConstraints(), onPressed: clickBoton);
  }
}
