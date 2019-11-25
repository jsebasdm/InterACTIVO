// Librerías
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Archivos Externos
import 'package:interactivo/Utilidades/Funciones.dart';
import 'package:interactivo/Utilidades/Constantes.dart';

// Clase Página Splash
class PaginaSplash extends StatefulWidget {
  EstadoPaginaSplash createState() => EstadoPaginaSplash();
}

// Estado Página Splash
class EstadoPaginaSplash extends State<PaginaSplash>
    with SingleTickerProviderStateMixin, AfterLayoutMixin<PaginaSplash> {
  // Campos Estado
  AnimationController controlador;
  Animation<double> animacion;
  bool inicioAnimacion = false;
  bool abanicoVisible = false;

  // Métodos Auxiliares Navegación
  void actualizarEstado() => setState(() {});
  void navegarPaginaIngreso() => Navigator.pushNamed(context, 'Ingreso');
  void navegarPaginaIngresoRetardo() => Future.delayed(Duration(milliseconds: 500), navegarPaginaIngreso);
  void mostrarAbanico() => setState(() => abanicoVisible = true);

  // Métodos Auxiliares Animación
  void iniciarAnimacion() {
    controlador.forward();
    inicioAnimacion = true;
  }

  // Método Controlador: Revisar Animación Finalizada
  void oyenteControlador(AnimationStatus estado) {
    if (estado == AnimationStatus.completed) navegarPaginaIngresoRetardo();
  }

  // Método Inicialización
  @override
  void initState() {
    super.initState();
    controlador = AnimationController(vsync: this, duration: Duration(seconds: 3));
    controlador.addStatusListener(oyenteControlador);
    animacion = Tween<double>(begin: 120, end: 0).animate(controlador);
  }

  // Método Construcción Inicial
  @override
  void afterFirstLayout(BuildContext context) {
    animacion.addListener(actualizarEstado);
    mostrarAbanico();
    Future.delayed(Duration(seconds: 2), iniciarAnimacion);
  }

  // Método Finalización
  @override
  dispose() {
    controlador?.dispose();
    super.dispose();
  }

  // Método Contenido Gráfico
  @override
  Widget build(BuildContext context) {
    final columnaElementos = Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      if (abanicoVisible) ConjuntoAbanicoLogo(superior: true),
      SloganCentral(altura: animacion.value),
      if (abanicoVisible) ConjuntoAbanicoLogo(superior: false),
    ]);
    return Scaffold(body: SafeArea(child: GestureDetector(child: columnaElementos, onTap: navegarPaginaIngreso)));
  }
}

// Clase Slogan Central
class SloganCentral extends StatelessWidget {
  // Atributos
  final double altura;
  // Constructor
  SloganCentral({this.altura});
  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    return Container(
      height: altura,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
      child: Center(child: SvgPicture.asset('assets/graficos/Slogan.svg')),
    );
  }
}

// Clase Recortador Figura
class Recortador extends CustomClipper<Path> {
  // Atributos
  final bool orientacion;
  final double margen = 30;
  // Constructor
  Recortador(this.orientacion);

  // Métodos Recortador
  bool shouldReclip(CustomClipper oldClipper) => false;
  getClip(Size tamagno) {
    // Variables de tamaño del elemento e inicialización
    final double h = tamagno.height;
    final double w = tamagno.width;
    final trayecto = Path();

    // Generar trayecto para generar forma de trapecio
    trayecto
      ..lineTo((orientacion) ? 0 : margen, 0)
      ..lineTo((orientacion) ? margen : 0, h)
      ..lineTo((orientacion) ? w - margen : w, h)
      ..lineTo((orientacion) ? w : w - margen, 0)
      ..close();
    return trayecto;
  }
}

// Clase Franja Abanico
class FranjaAbanico extends StatelessWidget {
  // Atributos
  final Color color;
  final bool orientacionRecorte;
  // Constructor
  FranjaAbanico(double luminosidad, this.orientacionRecorte)
      : color = colorHslAbanico.withLightness(luminosidad).toColor();
  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    final borde = Border(bottom: BorderSide(width: 1, color: Colors.white));
    final contenedorFranja = Container(decoration: BoxDecoration(color: color, border: borde));
    return Expanded(child: ClipPath(clipper: Recortador(orientacionRecorte), child: contenedorFranja));
  }
}

// Clase Lista Abanico
class ColumnaAbanico extends StatelessWidget {
  // Atributos
  final List<ValorRango> listaIntensidades;
  // Constructor
  ColumnaAbanico({bool ubicacion})
      : listaIntensidades = ValorRango.crearListaRango(totalValores: 8, limiteA: 0.5, limiteB: 0.9, orden: ubicacion);
  // Método Mapeo Franjas
  Widget mapeoFranjas(ValorRango luminosidad) => FranjaAbanico(luminosidad.valor, luminosidad.esIndicePar);
  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    final listaFranjas = listaIntensidades.map(mapeoFranjas).toList();
    return Column(children: listaFranjas);
  }
}

// Clase Conjunto: Abanico + Logo
class ConjuntoAbanicoLogo extends StatelessWidget {
  // Atributos
  final bool superior;
  final String rutaGraficos = 'assets/graficos/';
  // Constructor
  ConjuntoAbanicoLogo({this.superior});
  // Método Contenido Gráfico
  @override
  Widget build(BuildContext contexto) {
    final posicionLogo = (superior) ? Alignment.bottomCenter : Alignment.topCenter;
    final imagenLogo = rutaGraficos + ((superior) ? 'LogoInter.svg' : 'LogoActivo.svg');
    final contenedorLogo = Container(alignment: posicionLogo, child: SvgPicture.asset(imagenLogo, width: 150));
    return Expanded(child: Stack(children: [ColumnaAbanico(ubicacion: superior), contenedorLogo]));
  }
}
