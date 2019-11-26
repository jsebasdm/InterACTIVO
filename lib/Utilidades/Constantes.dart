// Librerías
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:interactivo/Paginas/PaginaSplash.dart';
import 'package:interactivo/Paginas/PaginaIngreso.dart';
import 'package:interactivo/Paginas/PaginaPrimerHabilidad.dart';
import 'package:interactivo/Paginas/PaginaFormulario.dart';
import 'package:interactivo/Paginas/PaginaGaleria.dart';
import 'package:interactivo/Paginas/PaginaLista.dart';
import 'package:interactivo/Paginas/PaginaDespedida.dart';

import 'package:interactivo/Paginas/PaginaPruebas.dart';

// Mapa de Rutas
final Map<String, Widget Function(BuildContext contexto)> mapaRutas = {
  'Splash': (BuildContext contexto) => PaginaSplash(),
  'Ingreso': (BuildContext contexto) => PaginaIngreso(),
  'HabilidadUno': (BuildContext contexto) => PaginaPrimerHabilidad(),
  'Formulario': (BuildContext contexto) => PaginaFormulario(),
  'Galeria': (BuildContext contexto) => PaginaGaleria(),
  'Lista': (BuildContext contexto) => PaginaLista(),
  'Despedida': (BuildContext contexto) => PaginaDespedida(),
  'Pruebas': (BuildContext contexto) => PaginaPruebas(),
};

// Colores
const Color colorAzulClaro = Color(0xFF00AFEE);
const Color colorAzulOpaco = Color(0xFF003B4B);
const Color colorGrisAzulado = Color(0xFF293742);
const Color colorValidaciones = Color(0xFFB71C1C);
final HSLColor colorHslAbanico = HSLColor.fromColor(colorAzulClaro);

// Estilos Texto
const TextStyle estiloCampos = TextStyle(fontFamily: 'Roboto', fontSize: 18, color: colorAzulOpaco);
const TextStyle estiloNombreColaborador = TextStyle(fontFamily: 'Roboto', fontSize: 17, color: Colors.white);
const TextStyle estiloCargoColaborador =
    TextStyle(fontFamily: 'Roboto', fontSize: 15, color: Colors.white70, fontStyle: FontStyle.italic);
const TextStyle estiloValidaciones =
    TextStyle(fontFamily: 'Roboto', fontSize: 16, color: colorValidaciones, fontStyle: FontStyle.italic);
const TextStyle estiloBoton =
    TextStyle(fontFamily: 'Roboto', fontSize: 20, color: Colors.white);
const TextStyle estilohabil = TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 40, color: Colors.black, fontStyle: FontStyle.italic);
const TextStyle estilohabilidad = TextStyle(fontFamily: 'Roboto', fontSize: 25,color: Colors.black);