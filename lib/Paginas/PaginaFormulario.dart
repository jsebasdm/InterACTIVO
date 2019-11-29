// Librerías
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:interactivo/Componentes/BotonFormulario.dart';
import 'package:interactivo/Componentes/CartaGaleria.dart';
import 'package:interactivo/Componentes/FiltrosArea.dart';
import 'package:interactivo/Componentes/SeleccionNivel.dart';
import 'package:interactivo/Modelos/Area.dart';
import 'package:interactivo/Modelos/Habilidad.dart';
import 'package:interactivo/Modelos/Nivel.dart';
import 'package:interactivo/Modelos/Registro.dart';
import 'package:interactivo/Paginas/PlantillaPagina.dart';
import 'package:interactivo/Componentes/Ruleta.dart';
import 'package:interactivo/Componentes/BarraBusqueda.dart';
import 'package:interactivo/Main.dart';

// Clase Página
class PaginaFormulario extends StatefulWidget {
  EstadoPaginaFormulario createState() => EstadoPaginaFormulario();
}

// Estado Página
class EstadoPaginaFormulario extends State<PaginaFormulario> {
  // Constantes
  static const double opacidadLateral = 0.4;
  static const double fraccionAnchoCarta = 0.45;

  // Atributos Elementos Seleccionados
  Habilidad habilidadSeleccionada;
  Nivel nivelSeleccionado;
  String versionSeleccionada = 'Sin Seleccionar';
  Area areaSeleccionada;

  // Atributos Habilidades
  List<Habilidad> listaTotalHabilidades;
  List<Habilidad> listaHabilidadesVisibles;
  List<CartaGaleria> listaCartas;
  int indiceHabilidadActual;

  // Métodos Auxiliares
  // Actualizar Estado
  void actualizarEstado() => setState(() {});

  // Filtrar Habilidades
  List<Habilidad> filtrarHabilidades(List<Habilidad> lista, Area area) {
    // Métodos Filtrado: Cumple con Área
    bool cumpleConArea(Habilidad habilidad) => habilidad.area.nombre == area.nombre;

    // Métodos Filtrado: Habilidad ya Agregada por Usuario
    bool habilidadNoAgregada(Habilidad habilidad) {
      for (Registro registro in listaRegistros) {
        if (habilidad.nombre == registro.habilidad.nombre) return false;
      }
      return true;
    }

    final listaHabilidadesArea = lista.where(cumpleConArea).toList();
    return listaHabilidadesArea.where(habilidadNoAgregada).toList();
  }

  // Actualizar Opacidades Cartas al Desplazar
  void actualizarOpacidadCarta(int indice, double opacidad) {
    listaCartas[indice] = crearCarta(indice: indice, opacidad: opacidad);
  }

  // Crear Carta
  CartaGaleria crearCarta({int indice, double opacidad}) {
    Habilidad habilidad = listaHabilidadesVisibles[indice];
    final registro = Registro(habilidad: habilidad);
    return CartaGaleria(registro: registro, opacidad: opacidad, enGaleria: false);
  }

  // Inicialización Cartas según Habilidades
  MapEntry<int, CartaGaleria> mapearHabilidadesACartas(int indice, Habilidad habilidad) {
    double opacidad = opacidadLateral;
    if (indice == indiceHabilidadActual) opacidad = 1;
    return MapEntry(indice, crearCarta(indice: indice, opacidad: opacidad));
  }

  // Método Selección Nueva Carta
  void cambioCarta(int indiceCarta) {
    // Actualizar habilidades seleccionada
    indiceHabilidadActual = indiceCarta;
    habilidadSeleccionada = listaHabilidadesVisibles[indiceHabilidadActual];

    // Actualizar Apariencia Cartas
    for (int indice = 0; indice < listaHabilidadesVisibles.length; indice++) {
      if (indice == indiceHabilidadActual) actualizarOpacidadCarta(indice, 1); // Activar cartal actual
      if (indice != indiceHabilidadActual) actualizarOpacidadCarta(indice, opacidadLateral); // Desactivar otras cartas
    }

    // Actualizar Estado
    actualizarEstado();
  }

  // Métodos Actualización Selecciones
  // Selección Nivel
  void seleccionarNivel(int posicion) {
    if (posicion == 1) nivelSeleccionado = Nivel.alto;
    if (posicion == 2) nivelSeleccionado = Nivel.medio;
    if (posicion == 3) nivelSeleccionado = Nivel.bajo;
  }

  // Selección Versión
  void clickVersion(String nombreVersion) {
    versionSeleccionada = nombreVersion;
  }

  // Selección Área
  void seleccionarArea(Area area) {
    areaSeleccionada = area;
    listaHabilidadesVisibles = filtrarHabilidades(listaTotalHabilidades, areaSeleccionada);
    listaCartas = List<CartaGaleria>(listaHabilidadesVisibles.length);
    cambioCarta(0);
    actualizarEstado();
  }

  // Método Click Botón Agregar
  void clickBotonAgregar() {
    print('Habilidad seleccionada: ${habilidadSeleccionada.nombre}');
    print('Nivel seleccionado: ${nivelSeleccionado?.nombre}');
    print('Versión seleccionada: $versionSeleccionada');
    Registro nuevoRegistro = Registro(
      version: versionSeleccionada,
      habilidad: habilidadSeleccionada,
      nivel: nivelSeleccionado
    );
    listaRegistros.insert(0, nuevoRegistro);
    Navigator.popAndPushNamed(context, 'Galeria');
    //final textoMensaje = 'Sí funcionó ${habilidadSeleccionada.nombre}';
    //Scaffold.of(context).showSnackBar(SnackBar(content: Text(textoMensaje)));
    //actualizarEstado();
  }

  // Método Inicialización
  void initState() {
    super.initState();
    listaTotalHabilidades = Habilidad.obtenerMapaPrueba().values.toList();
    areaSeleccionada = Area.desarrollo;
    listaHabilidadesVisibles = filtrarHabilidades(listaTotalHabilidades, areaSeleccionada);
    listaCartas = List<CartaGaleria>(listaHabilidadesVisibles.length);
    cambioCarta(0);
  }

  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    // Elementos Página Formulario:
    final barraBusqueda = BarraBusqueda();

    // Botones Filtro por Área
    final botonesFiltro = FiltrosArea(funcionClick: seleccionarArea, areaSeleccionada: areaSeleccionada);

    // Galería Cartas
    final galeriaCartas = CarouselSlider(
      autoPlay: false,
      enlargeCenterPage: true,
      enableInfiniteScroll: false,
      initialPage: indiceHabilidadActual,
      height: 200,
      items: listaCartas,
      onPageChanged: cambioCarta,
      viewportFraction: fraccionAnchoCarta,
    );

    // Ruleta
    final cartaRuleta = GeneradorRuleta(habilidad: habilidadSeleccionada, funcionCambioVersion: clickVersion);

    // Selector Nivel
    final cartaNivel = SeleccionNivel(funcionCambioNivel: seleccionarNivel);

    // Botón Agregar Habilidad
    final botonAgregar = BotonFormulario(clickBoton: clickBotonAgregar, texto: 'Aceptar');

    // Separadores
    final separador = SizedBox(height: 25);
    final separadorInferior = SizedBox(height: 50);

    // Unión Contenido
    final listaContenido = [
      barraBusqueda,
      separador,
      botonesFiltro,
      separador,
      galeriaCartas,
      separador,
      cartaRuleta,
      separador,
      cartaNivel,
      separador,
      botonAgregar,
      separadorInferior,
    ];

    // Plantilla
    return PlantillaPagina(listaContenido: listaContenido);
  }
}
