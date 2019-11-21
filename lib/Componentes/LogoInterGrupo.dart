// Librerías
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:interactivo/Utilidades/Constantes.dart';

// Clase
class LogoInterGrupo extends StatelessWidget {
  // Atributos
  final String textoArriba;
  final String textoAbajo;
  final double tamagnoCuadro;
  final double tamagnoLetra;
  final Color colorFondo;
  final Color colorLetra;

  // Constructor
  LogoInterGrupo({
    this.textoArriba = 'Inter',
    this.textoAbajo = 'Grupo',
    this.tamagnoCuadro = 48,
    this.tamagnoLetra = 13,
    this.colorFondo = colorAzulClaro,
    this.colorLetra = Colors.white,
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

  // Método Contenido Gráfico
  @override
  Widget build(BuildContext contexto) {
    return Container(
      color: colorFondo,
      width: tamagnoCuadro,
      height: tamagnoCuadro,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          crearTexto(textoArriba, tamagnoLetra, espaciado: 1),
          crearTexto(textoAbajo, tamagnoLetra - 2, espaciado: 0),
        ],
      ),
    );
  }
}
