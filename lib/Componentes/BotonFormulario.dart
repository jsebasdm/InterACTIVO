// Librerías
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:interactivo/Utilidades/Constantes.dart';

// Clase Botón Ingresar Login / Agregar Habilidad
class BotonFormulario extends StatelessWidget {
  // Atributos
  final Function clickBoton;
  final String texto;
  // Constructor
  BotonFormulario({this.clickBoton, this.texto});
  // Método Contenido Gráfico
  Widget build(BuildContext context) {
    final textoBoton = Text(texto, textAlign: TextAlign.center, style: estiloBotonIngresar);
    final interiorBoton = MaterialButton(onPressed: clickBoton, child: textoBoton, minWidth: double.infinity);
    final radioBorde = BorderRadius.circular(10);
    final boton = Material(elevation: 5, borderRadius: radioBorde, color: colorAzulOpaco, child: interiorBoton);
    return Container(padding: EdgeInsets.symmetric(horizontal: 15), child: boton);
  }
}