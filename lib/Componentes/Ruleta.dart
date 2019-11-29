// Librerías
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:interactivo/Utilidades/Constantes.dart';

// Clase Ruleta
class Ruleta extends StatefulWidget {
  State<StatefulWidget> createState() => RuletaState();
}

// Estado Ruleta
class RuletaState extends State {
  int indicePresionado;
  List<SeccionGrafico> listaSecciones;
  static const totalSecciones = 4;

  @override
  void initState() {
    super.initState();
    listaSecciones = List.generate(totalSecciones, (int indice) {
      final double luminosidad = (indice / totalSecciones) * 0.8;
      final color = HSLColor.fromColor(colorAzulOpaco).withLightness(luminosidad).toColor();
      return SeccionGrafico(colorSeccion: color, version: 'V $indice.0');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PieChart(
        PieChartData(
            pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
              setState(() {
                if (pieTouchResponse.touchedSectionIndex != null) {
                  indicePresionado = pieTouchResponse.touchedSectionIndex;
                }
              });
            }),
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 20,
            sections: showingSections()),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(totalSecciones, (int indiceActual) {
      final estaPresionado = (indiceActual == indicePresionado);
      final double tamagnoFuente = estaPresionado ? 20 : 16;
      final double radio = estaPresionado ? 105 : 90;

      return PieChartSectionData(
        titlePositionPercentageOffset: 0.6,
        color: listaSecciones[indiceActual].colorSeccion,
        value: 36,
        title: listaSecciones[indiceActual].version,
        radius: radio,
        titleStyle: TextStyle(fontSize: tamagnoFuente, fontWeight: FontWeight.bold, color: Colors.white),
      );
    });
  }
}

class SeccionGrafico {
  final String version;
  final Color colorSeccion;

  SeccionGrafico({this.version, this.colorSeccion});
}
