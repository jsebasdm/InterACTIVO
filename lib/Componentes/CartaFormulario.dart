// Librerías
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:interactivo/Utilidades/Constantes.dart';

// Clase Carta Galería
class CartaFormulario extends StatelessWidget {
  // Atributo
  final Widget contenido;
  final String titulo;
  final String valorInicial;

  // Constructor
  CartaFormulario({this.contenido, this.titulo, this.valorInicial});

  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    // Encabezado Carta
    final encabezado = Container(
      color: colorAzulOpaco,
      padding: EdgeInsets.all(18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(titulo, style: estiloTituloBarra), Text(valorInicial, style: estiloSubtituloBarra)],
      ),
    );

    // Contenedor Total Carta
    return Container(
      height: 370,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: Colors.white,
        child: Column(children: [encabezado, contenido]),
      ),
    );
  }
}
