// Librerías
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:interactivo/Utilidades/Constantes.dart';

// Clase Enumerada Auxiliar
enum ParteLogo { Superior, Inferior, Completo }

// Clase
class LogoInterGrupo extends StatelessWidget {
  // Atributos
  final String textoArriba;
  final String textoAbajo;
  final double tamagnoCuadro;
  final double tamagnoLetra;
  final Color colorFondo;
  final Color colorLetra;
  final ParteLogo parte;

  // Constructor
  LogoInterGrupo({
    this.textoArriba = 'Inter',
    this.textoAbajo = 'Grupo',
    this.tamagnoCuadro = 48,
    this.tamagnoLetra = 13,
    this.colorFondo = colorAzulOpaco,
    this.colorLetra = Colors.white,
    this.parte = ParteLogo.Completo,
  });

  // Método Auxiliar Textos
  Widget crearTexto(String texto, double tamagno, {double espaciado}) {
    return Text(
      texto,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        color: colorLetra,
        fontSize: tamagno,
        letterSpacing: espaciado,
      ),
    );
  }

  Widget contenedorLogo({Widget hijo, double alto, Alignment alineacion}) {
    Widget elementoAlineado = Align(child: hijo, alignment: alineacion);
    return Container(color: colorFondo, width: tamagnoCuadro, height: alto, child: elementoAlineado);
  }

  // Método Contenido Gráfico
  @override
  Widget build(BuildContext contexto) {
    // Parte Superior
    Widget textoSuperior = crearTexto(textoArriba, tamagnoLetra, espaciado: 1);
    if (parte == ParteLogo.Superior)
      return contenedorLogo(hijo: textoSuperior, alto: tamagnoCuadro / 2, alineacion: Alignment.bottomCenter);

    // Parte Inferior
    Widget textoInferior = crearTexto(textoAbajo, tamagnoLetra - 2, espaciado: 0);
    if (parte == ParteLogo.Inferior)
      return contenedorLogo(hijo: textoInferior, alto: tamagnoCuadro / 2, alineacion: Alignment.topCenter);

    // Logo Completo
    Widget columnaTextos = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[textoSuperior, textoInferior]
    );
    return contenedorLogo(alto: tamagnoCuadro, alineacion: Alignment.center, hijo: columnaTextos);
  }

}
