// Librería
import 'package:flutter/material.dart';

// Componentes
import 'package:interactivo/Modelos/Area.dart';
import 'package:interactivo/Utilidades/Constantes.dart';

// Clase
class FiltrosArea extends StatelessWidget {
  // Atributos
  final Area areaSeleccionada;
  final Function funcionClick;

  // Constructor
  FiltrosArea({this.areaSeleccionada, this.funcionClick});

  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    // Botón Desarrollo
    bool seleccionado = (areaSeleccionada.nombre == 'Desarrollo');
    final botonDesarrollo = BotonFiltro(
      area: Area.desarrollo,
      seleccionado: seleccionado,
      funcionClick: funcionClick,
    );

    // Botón Infraestructura
    seleccionado = (areaSeleccionada.nombre == 'Infraestructura');
    final botonInfraestructura = BotonFiltro(
      area: Area.infraestructura,
      seleccionado: seleccionado,
      funcionClick: funcionClick,
    );

    // Fila Botones
    final botonesFiltro = [botonDesarrollo, botonInfraestructura];
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: botonesFiltro);
  }
}

// Clase Botón Filtro
class BotonFiltro extends StatelessWidget {
  // Atributos
  final Area area;
  final bool seleccionado;
  final Function funcionClick;

  // Constructor
  BotonFiltro({this.area, this.seleccionado, this.funcionClick});

  // Método Contenido Gráfico
  Widget build(BuildContext context) {
    // Contenido Botón
    String rutaIcono = (seleccionado) ? area.rutaIconoBlanco : area.rutaIconoNegro;
    final imagenIcono = Image(image: AssetImage(rutaIcono), width: 30);
    final colorTexto = (seleccionado) ? Colors.white : Colors.black;
    final texto = Text(area.nombre, style: TextStyle(color: colorTexto, fontSize: 15));
    final filaContenido = Row(mainAxisSize: MainAxisSize.min, children: [imagenIcono, SizedBox(width: 10), texto]);
    final contenido = Container(child: filaContenido, padding: EdgeInsets.symmetric(vertical: 8));

    // Forma Botón
    final forma = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
    final colorBoton = (seleccionado) ? colorAzulOpaco : Colors.grey[100];
    return RaisedButton(child: contenido, color: colorBoton, onPressed: () => funcionClick(area), shape: forma);
  }
}
