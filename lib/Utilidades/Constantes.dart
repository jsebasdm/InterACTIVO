// Librerías
import 'package:flutter/material.dart';

// Archivos Páginas
import 'package:interactivo/Paginas/PaginaIngreso.dart';
import 'package:interactivo/Paginas/PaginaLista.dart';
import 'package:interactivo/Paginas/PaginaSinHabilidades.dart';
import 'package:interactivo/Paginas/PaginaSplash.dart';
import 'package:interactivo/Paginas/PaginaGaleria.dart';
import 'package:interactivo/Paginas/PaginaFormulario.dart';

// Colores
const Color colorAzulClaro = Color(0xFF00AFEE);
const Color colorAzulOpaco = Color(0xFF003B4B);
const Color colorGrisAzulado = Color(0xFF293742);
const Color colorValidaciones = Color(0xFFB71C1C);
const Color colorBlancoClaro = Color(0xB0FFFFFF);
final Color colorFondo = Colors.blueGrey[50];
final HSLColor colorHslAbanico = HSLColor.fromColor(colorAzulClaro);

// Estilos Texto
const estiloCampos = TextStyle(fontSize: 18, color: colorAzulOpaco);
const estiloTituloBarra = TextStyle(fontSize: 17, color: Colors.white);
const estiloSubtituloBarra = TextStyle(fontSize: 16, color: colorBlancoClaro, fontStyle: FontStyle.italic);
const estiloTituloLista = TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold);
const estiloSubtituloLista = TextStyle(fontSize: 14, color: colorGrisAzulado, fontStyle: FontStyle.italic);
const estiloValoresCarta = TextStyle(fontSize: 14, color: colorBlancoClaro, fontStyle: FontStyle.italic);
const estiloValidaciones = TextStyle(fontSize: 16, color: colorValidaciones, fontStyle: FontStyle.italic);
const estiloBotonIngresar = TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold);
const estiloTituloDialogoA = TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold);
const estiloTituloDialogoB = TextStyle(fontSize: 24, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic);
const estiloFraseMotivacional = TextStyle(fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);
const estiloBotonNuevaHabilidad = TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300);

// Mapa Rutas
final Map<String, Widget Function(BuildContext contexto)> mapaRutas = {
  'Splash': (BuildContext contexto) => PaginaSplash('LogoInter', 'LogoActivo'),
  'Despedida': (BuildContext contexto) => PaginaSplash('LogoRegresa', 'LogoPronto'),
  'Ingreso': (BuildContext contexto) => PaginaIngreso(),
  'Galeria': (BuildContext contexto) => PaginaGaleria(),
  'SinHabilidades' : (BuildContext contexto) => PaginaSinHabilidades(),
  'Lista': (BuildContext contexto) => PaginaLista(),
  'Formulario': (BuildContext contexto) => PaginaFormulario(),
};
