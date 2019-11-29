
// Librerías
//import 'package:carousel_slider/carousel_slider.dart';
//import 'package:flutter/material.dart';

// Archivos Externos
//import 'package:interactivo/Componentes/CartaGaleria.dart';
//import 'package:interactivo/Modelos/Habilidad.dart';
//import 'package:interactivo/Modelos/Registro.dart';

/*
// Clase Galería Formulario
class GaleriaFormulario extends StatefulWidget {
  // Atributos
  final List<Habilidad> listaHabilidades;
  final Function cambioCarta;

  // Constructor
  GaleriaFormulario(this.listaHabilidades, this.cambioCarta);

  // Creación de Estado
  EstadoGaleriaFormulario createState() => EstadoGaleriaFormulario();
}

// Estado Galería Formulario
class EstadoGaleriaFormulario extends State<GaleriaFormulario> {
  // Constantes
  static const double opacidadLateral = 0.4;
  static const double fraccionAnchoCarta = 0.45;

  // Campos Estado
  List<CartaGaleria> listaCartas;
  int indiceActual;

  // Método Actualizar Estado
  void actualizarEstado() => setState(() {});









  // Método Inicialización
  void initState() {
    super.initState();
    indiceActual = 0;
    listaCartas = widget.listaHabilidades.asMap().map(mapearHabilidadesACartas).values.toList();
    widget.cambioCarta(0);
  }

  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    return CarouselSlider(
      autoPlay: false,
      enlargeCenterPage: true,
      enableInfiniteScroll: false,
      initialPage: indiceActual,
      height: 220,
      items: listaCartas,
      onPageChanged: cambioCarta,
      viewportFraction: fraccionAnchoCarta,
    );
  }
}
*/

