// Librerías
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Archivos Externos
import 'package:interactivo/Main.dart';
import 'package:interactivo/Componentes/CartaGaleria.dart';
import 'package:interactivo/Modelos/Habilidad.dart';
import 'package:interactivo/Modelos/Registro.dart';
import 'package:interactivo/Paginas/PlantillaPagina.dart';
import 'package:interactivo/Utilidades/Constantes.dart';
import 'package:interactivo/Componentes/AccionesDialogo.dart';

// Clase Página
class PaginaGaleria extends StatelessWidget {
  Widget build(BuildContext contexto) {
    return PlantillaPagina(listaContenido: [Galeria()], nombreLogo: 'LogoInterActivo');
  }
}

// Clase Galería
class Galeria extends StatefulWidget {
  EstadoGaleria createState() => EstadoGaleria();
}

// Estado Galería
class EstadoGaleria extends State<Galeria> {
  // Constantes
  static const double opacidadLateral = 0.4;
  static const double fraccionAltoCarta = 0.6;
  static const double fraccionAnchoCarta = 0.75;
  final llaveCarrusel = GlobalKey();

  // Campos Estado
  List<CartaGaleria> listaCartas;
  int indiceActual;

  // Métodos Auxiliares
  // Navegar por Galería Vacía
  void navegarPaginaSinHabilidades() => Navigator.popAndPushNamed(context, 'SinHabilidades');
  void navegarPaginaSinHabilidadesRetardo() => Future.delayed(Duration(seconds: 3), navegarPaginaSinHabilidades);

  // Crear Carta
  CartaGaleria crearCarta({int indice, double opacidad, Registro registro}) {
    registro ??= listaRegistros[indice];
    return CartaGaleria(registro: registro, opacidad: opacidad, clickEliminar: () => abrirDialogoEliminacion(indice));
  }

  // Inicialización Cartas según Registros
  MapEntry<int, CartaGaleria> mapearRegistrosACartas(int indice, Registro registro) {
    double opacidad = opacidadLateral;
    if (indice == indiceActual) opacidad = 1;
    return MapEntry(indice, crearCarta(indice: indice, opacidad: opacidad, registro: registro));
  }

  // Cambiar Opacidad Carta Lista
  void actualizarOpacidadCarta(int indice, double opacidad) {
    listaCartas[indice] = crearCarta(indice: indice, opacidad: opacidad);
  }

  // Actualizar Estado
  void actualizarEstado() => setState(() {});

  // Método Selección Nueva Carta
  void cambioCarta(int indiceCarta) {
    indiceActual = indiceCarta;
    for (int indice = 0; indice < listaRegistros.length; indice++) {
      if (indice == indiceActual) actualizarOpacidadCarta(indice, 1); // Activar cartal actual
      if (indice != indiceActual) actualizarOpacidadCarta(indice, opacidadLateral); // Desactivar otras cartas
    }
    actualizarEstado();
  }

  // Método Abrir Diálogo Eliminación
  void abrirDialogoEliminacion(int indice) {
    final dialogo =
        DialogoEliminar(habilidad: listaRegistros[indice].habilidad, clickEliminar: () => eliminarCarta(indice));
    showDialog(context: context, barrierDismissible: true, builder: (BuildContext contexto) => dialogo);
  }

  // Método Eliminación Carta
  void eliminarCarta(int indice) {
    // Recuperar texto de registro antes de eliminar la carta
    String textoRegistro = listaRegistros[indiceActual].toString();

    // Remover carta de lista
    listaRegistros.removeAt(indiceActual);
    listaCartas.removeAt(indiceActual);

    // Mostrar mensaje de eliminación
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Has eliminado tu $textoRegistro')));

    // Verificar si fue la última habilidad eliminada para navegar hacia página sin habilidades
    if (listaRegistros.isEmpty) navegarPaginaSinHabilidadesRetardo();

    // Verificar si sólo queda una habilidad para corregir índice actual
    if (listaRegistros.length == 1) indiceActual = 0;

    // Mover carrusel hacia siguiente carta disponible
    CarouselSlider carrusel;
    if (listaRegistros.isNotEmpty) carrusel = llaveCarrusel.currentState.widget as CarouselSlider;
    if (indiceActual != 0) carrusel?.previousPage(duration: Duration(seconds: 1), curve: Curves.ease);

    // Reactivar carta inicial
    if (indiceActual == 0 && listaRegistros.isNotEmpty) listaCartas[0] = crearCarta(indice: 0, opacidad: 1);

    // Actualizar pantalla
    actualizarEstado();
  }

  // Método Incialización Estado
  void initState() {
    super.initState();
    indiceActual = 0;
    listaCartas = listaRegistros.asMap().map(mapearRegistrosACartas).values.toList();
  }

  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    // Retorno Lista Vacía
    if (listaRegistros.isEmpty) return Image.asset('assets/imagenes/otros/ListaVacia.png');

    // Retorno Única Carta
    final alturaCarta = MediaQuery.of(context).size.height * fraccionAltoCarta;
    final anchoCarta = MediaQuery.of(context).size.width * fraccionAnchoCarta;
    if (listaRegistros.length == 1) {
      final unicaCarta = crearCarta(indice: 0, opacidad: 1);
      return Container(width: anchoCarta, height: alturaCarta, child: unicaCarta);
    }

    // Retorno Galería (Lista con Habilidades)
    return CarouselSlider(
      key: llaveCarrusel,
      autoPlay: false,
      enlargeCenterPage: true,
      enableInfiniteScroll: false,
      initialPage: indiceActual,
      height: alturaCarta,
      items: listaCartas,
      onPageChanged: cambioCarta,
      viewportFraction: fraccionAnchoCarta,
    );
  }
}

class DialogoEliminar extends StatelessWidget {
  // Atributos
  final Function clickEliminar;
  final Habilidad habilidad;

  // Constructor
  DialogoEliminar({this.habilidad, this.clickEliminar});

  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    // Título (Resaltando Nombre Habilidad)
    final textos = [
      TextSpan(text: '¿Estás seguro de eliminar tu habilidad en '),
      TextSpan(text: '${habilidad.nombre}', style: estiloTituloDialogoB),
      TextSpan(text: ' ?'),
    ];
    final titulo = RichText(textAlign: TextAlign.center, text: TextSpan(style: estiloTituloDialogoA, children: textos));

    // Mensaje Cuerpo Diálogo
    final mensaje = ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        title: Text('¡Esto no se puede deshacer!'),
        subtitle: Text('Tendrás que agregar desde cero tu habilidad para recuperarla.'));

    // Imagenes Diálogo
    final rutaAnimacion = 'assets/animaciones/ArrojarBasura.flr';
    final animacion = FlareActor(rutaAnimacion, animation: 'Arrojar', fit: BoxFit.contain);
    final contenedorAnimacion = Container(child: animacion, width: 140, height: 140);
    final imagenSkill = Image(image: AssetImage(habilidad.rutaLogo), fit: BoxFit.contain);

    final filaGraficos = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Expanded(child: imagenSkill), SizedBox(width: 10), contenedorAnimacion],
    );
    final contenedorImagenes = Container(child: filaGraficos, padding: EdgeInsets.only(bottom: 10));

    // Contenido Interno
    final contenido = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [contenedorImagenes, mensaje],
    );

    // Acciones (Fila Botones)
    final acciones = AccionesDialogo(colorBoton: Colors.red[800], nombreBoton: 'Eliminar', funcionBoton: clickEliminar);

    // Construcción Final Diálogo
    final forma = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
    return AlertDialog(shape: forma, title: titulo, content: contenido, actions: [acciones]);
  }
}
