// Librerías
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:interactivo/Utilidades/Constantes.dart';
import 'package:interactivo/Modelos/Habilidad.dart';

// Clase Generador Ruleta
class GeneradorRuleta extends StatelessWidget {
  // Atributos
  final Habilidad habilidad;
  final Function funcionCambioVersion;

  // Constructor
  GeneradorRuleta({this.habilidad, this.funcionCambioVersion});

  // Método Generar Contenido Secciones
  SeccionGrafico generarContenidoSecciones(int indice) {
    int totalSecciones = habilidad.versiones.length;
    final double luminosidad = (indice / totalSecciones) * 0.6;
    final color = HSLColor.fromColor(colorAzulOpaco).withLightness(luminosidad).toColor();
    return SeccionGrafico(colorSeccion: color, version: habilidad.versiones[indice]);
  }

  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    // Contenido Secciones
    final listaSecciones = List.generate(habilidad.versiones.length, generarContenidoSecciones);
    return Ruleta(
      listaSecciones: listaSecciones,
      funcionCambioVersion: funcionCambioVersion,
      nombreHabilidad: habilidad.nombre,
    );
  }
}

// Clase Ruleta
class Ruleta extends StatefulWidget {
  // Atributos
  final String nombreHabilidad;
  final List<SeccionGrafico> listaSecciones;
  final Function funcionCambioVersion;
  // Constructor
  Ruleta({this.listaSecciones, this.funcionCambioVersion, this.nombreHabilidad});
  // Método Crear Estado
  EstadoRuleta createState() => EstadoRuleta();
}

// Estado Ruleta
class EstadoRuleta extends State<Ruleta> {
  // Atributos
  int indicePresionado = -1;

  // Método Reconstrucción Widget
  void didUpdateWidget(Ruleta ruletaAnterior) {
    super.didUpdateWidget(ruletaAnterior);
    indicePresionado = -1;
    widget.funcionCambioVersion('Sin seleccionar');
  }

  // Método Auxiliar
  void actualizarEstado() => setState(() {});

  // Método Actualización de Selección
  void seleccionSeccion(PieTouchResponse respuestaClickGrafico) {
    if (respuestaClickGrafico.touchedSectionIndex != null) {
      indicePresionado = respuestaClickGrafico.touchedSectionIndex;
    }
    // Versión seleccionada
    final versionSeleccionada = widget.listaSecciones[indicePresionado].version;
    widget.funcionCambioVersion(versionSeleccionada);
    actualizarEstado();
  }

  // Método Crear Secciones Gráficas según Contenido
  List<PieChartSectionData> crearSeccionesGrafico(List<SeccionGrafico> listaSecciones) {
    final int totalSecciones = listaSecciones.length;

    return List.generate(totalSecciones, (int indiceActual) {
      final estaPresionado = (indiceActual == indicePresionado);
      final double tamagnoFuente = estaPresionado ? 18 : 15;
      final double radio = estaPresionado ? 100 : 90;
      return PieChartSectionData(
        value: 1,
        radius: radio,
        titlePositionPercentageOffset: 0.65,
        color: listaSecciones[indiceActual].colorSeccion,
        title: listaSecciones[indiceActual].version,
        titleStyle: TextStyle(fontSize: tamagnoFuente, color: Colors.white, fontWeight: FontWeight.bold),
      );
    });
  }

  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    // Versión Carta
    String textoVersion;
    if (indicePresionado >= 0) textoVersion = '${widget.nombreHabilidad} ${widget.listaSecciones[indicePresionado].version}';
    final valor = (indicePresionado >= 0) ? textoVersion : 'Sin seleccionar';

    // Encabezado Carta
    final encabezado = Container(
      color: colorAzulOpaco,
      padding: EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text('Versión', style: estiloTituloBarra), Text(valor, style: estiloSubtituloBarra)],
      ),
    );

    final datosGrafico = PieChartData(
      pieTouchData: PieTouchData(touchCallback: seleccionSeccion),
      borderData: FlBorderData(show: false),
      sectionsSpace: 0,
      centerSpaceRadius: 20,
      sections: crearSeccionesGrafico(widget.listaSecciones),
    );
    final contenidoCarta = Expanded(child: PieChart(datosGrafico));

    final carta = Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.white,
      child: Column(children: [encabezado, contenidoCarta]),
    );

    return Container(height: 320, width: 340, padding: EdgeInsets.symmetric(horizontal: 30), child: carta);
  }
}

// Clase Auxiliar
class SeccionGrafico {
  // Atributos
  final String version;
  final Color colorSeccion;

  // Constructor
  SeccionGrafico({this.version, this.colorSeccion});

  // Método Depuración
  String toString() => 'Versión: $version';
}
