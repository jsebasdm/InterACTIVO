// Librerías
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Archivos Externos
import 'package:interactivo/Componentes/BarraSuperior.dart';
import 'package:interactivo/Componentes/MenuNavegacion.dart';
import 'package:interactivo/Utilidades/Constantes.dart';

// Clase Plantilla
class PlantillaPagina extends StatelessWidget {
  // Atributos
  final bool hayBarraSuperior;
  final bool hayMenuNavegacion;
  final Widget decoracionFondo;
  final String nombreLogo;
  final List<Widget> listaContenido;
  final double paddingContenido;

  // Constructor
  PlantillaPagina({
    this.listaContenido,
    this.decoracionFondo,
    this.hayMenuNavegacion = true,
    this.hayBarraSuperior = true,
    this.paddingContenido = 0,
    this.nombreLogo,
  });

  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    // Método Navegación Botón Flotante
    void navegarFormulario() => Navigator.popAndPushNamed(contexto, 'Formulario');

    // Contenido Deslizable (Propio de cada Página)
    final columnaElementos = Column(children: listaContenido);
    final paddingPagina = EdgeInsets.all(paddingContenido);
    final vistaDeslizable = Center(child: SingleChildScrollView(child: columnaElementos, padding: paddingPagina));

    // Fondo
    final decoracion = decoracionFondo ?? Container(color: colorFondo);
    final alturaPagina = MediaQuery.of(contexto).size.height;
    final fondo = Positioned(top: 0, left: 0, right: 0, height: alturaPagina, child: decoracion);

    // Logo Superior
    Container contenedorLogo;
    if (nombreLogo != null) {
      final iconoLogo = SvgPicture.asset('assets/graficos/$nombreLogo.svg', width: 40);
      final filaLogo = Row(children: [iconoLogo], mainAxisAlignment: MainAxisAlignment.end);
      contenedorLogo = Container(child: filaLogo, padding: EdgeInsets.all(10));
    }

    // Unión Elementos Contenido: Fondo + Logo Superior + Contenido Deslizable
    final stackContenido = Stack(children: [fondo, contenedorLogo ?? SizedBox.shrink(), vistaDeslizable]);

    // Barra Superior
    final barraSuperior = BarraSuperior();
    final visibilidadBarraSuperior = Visibility(visible: hayBarraSuperior, child: barraSuperior);

    // Unión: Barra Superior + Contenido
    final cuerpoPagina = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [visibilidadBarraSuperior, Expanded(child: stackContenido)],
    );

    // Menú Navegación
    final menuNavegacion = MenuNavegacion();
    final visibilidadMenuNavegacion = Visibility(visible: hayMenuNavegacion, child: menuNavegacion);

    // Botón Acción Flotante
    final botonFlotante = FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: navegarFormulario,
        tooltip: 'Agregar Habilidad',
        backgroundColor: colorAzulClaro);
    final visibilidadbotonFlotante = Visibility(visible: hayMenuNavegacion, child: botonFlotante);

    // Andamio Total Plantilla
    return Scaffold(
      body: SafeArea(child: cuerpoPagina),
      bottomNavigationBar: visibilidadMenuNavegacion,
      floatingActionButton: visibilidadbotonFlotante,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
