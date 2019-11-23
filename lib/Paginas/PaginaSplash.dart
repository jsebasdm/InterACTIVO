// Librerías
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:interactivo/Componentes/FondoAbanico.dart';
import 'package:interactivo/Componentes/LogoInterGrupo.dart';

// Clase Página
class PaginaSplash extends StatefulWidget {
  EstadoPaginaSplash createState() => EstadoPaginaSplash();
}

// Clase Estadp
class EstadoPaginaSplash extends State<PaginaSplash> with SingleTickerProviderStateMixin {
  // Atributos Animación
  AnimationController controlador;
  Animation<double> animacion;

  // Métodos Auxiliares
  void actualizarEstado() => setState(() {});
  void iniciarAnimacion() => controlador.forward();

  // Método Inicialización
  @override
  initState() {
    super.initState();
    controlador = AnimationController(vsync: this, duration: Duration(seconds: 2));
    controlador.addStatusListener((AnimationStatus estado) {
      if (estado == AnimationStatus.completed) Navigator.pushNamed(context, 'Ingreso');
    });
    animacion = Tween<double>(begin: 120, end: 0).animate(controlador);
    animacion.addListener(actualizarEstado);
  }

  // Método Finalización
  @override
  dispose() {
    controlador?.dispose();
    super.dispose();
  }

  // ELEMENTOS GRÁFICOS
  // Conjunto: Franjas + Logo
  Widget franjasLogo({bool superior}) {
    // Franjas
    List<Widget> listaFranjas = FondoAbanico.listaFranjas(superior: superior);
    // Logo
    Alignment posicionLogo = (superior) ? Alignment.bottomCenter : Alignment.topCenter;
    ParteLogo parte = (superior) ? ParteLogo.Superior : ParteLogo.Inferior;
    Container contenedorLogo = Container(
      alignment: posicionLogo,
      child: LogoInterGrupo(parte: parte, textoAbajo: 'ACTIVO', tamagnoCuadro: 160, tamagnoLetra: 40),
    );

    // Elemento Combinado: Franjas + Logo
    return Expanded(child: Stack(children: <Widget>[Column(children: listaFranjas), contenedorLogo]));
  }

  // Slogan Central: InterGrupo
  Widget sloganCentral() {
    return Container(
      height: animacion.value,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
      child: Center(child: Image(image: AssetImage('assets/imagenes/SloganSplash.png'))),
    );
  }

  // Método Contenido Gráfico
  @override
  Widget build(BuildContext context) {
    List<Widget> listaElementos = [franjasLogo(superior: true), sloganCentral(), franjasLogo(superior: false)];
    return Scaffold(
        body: SafeArea(child: GestureDetector(child: Column(children: listaElementos), onTap: iniciarAnimacion)));
  }
}
