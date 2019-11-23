// Librerías
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:interactivo/Utilidades/Funciones.dart';

// Clase Estática
class FondoAbanico {
  // Método Estático
  static List<Widget> listaFranjas({bool superior}) {
    List<double> listaIntensidades = crearListaRango(totalValores: 8, limiteA: 0.5, limiteB: 0.9, orden: superior);
    return listaIntensidades.map(franjaColor).toList();
  }

  // Método Auxiliar: Franja Individual
  static Widget franjaColor(double luminosidad) {
    Color color = HSLColor.fromColor(Colors.blue).withLightness(luminosidad).toColor();
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: color, border: Border(bottom: BorderSide(width: 1, color: Colors.white))),
      ),
    );
  }
}