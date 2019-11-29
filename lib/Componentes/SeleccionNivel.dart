// Librería
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

// Archivos Externos
import 'package:interactivo/Utilidades/Constantes.dart';

// Clase Página
class SeleccionNivel extends StatefulWidget {
  @override
  _SeleccionNivel createState() => new _SeleccionNivel();
}

// ELEMENTOS GRÁFICOS
// Contenido Principal de Página
class _SeleccionNivel extends State<SeleccionNivel> {
  String imagen1 = 'assets/imagenes/podio/Podio1Inactivo.jpg';
  String imagen2 = 'assets/imagenes/podio/Podio2Inactivo.jpg';
  String imagen3 = 'assets/imagenes/podio/Podio3Inactivo.jpg';
  double opacidadNivel1 = 0.0;
  double opacidadNivel2 = 0.0;
  double opacidadNivel3 = 0.0;
  final animacion1 = 'PrimerPuesto';
  final animacion2 = 'SegundoPuesto';
  final animacion3 = 'TercerPuesto';
  final medallaOro = 'assets/imagenes/medallas/MedallaOro.png';
  final medallaPlata = 'assets/imagenes/medallas/MedallaPlata.png';
  final medallaBronce = 'assets/imagenes/medallas/MedallaBronce.png';
  double dimensionBotonOro = 50.0;
  double dimensionBotonPlata = 50.0;
  double dimensionBotonBronce = 50.0;
  Color colorBotonOro = Colors.blueGrey[50];
  Color colorBotonPlata = Colors.blueGrey[50];
  Color colorBotonBronce = Colors.blueGrey[50];

  void _accionSeleccionNivel(int nivel) {
    setState(() {
      if (nivel == 1) {
        imagen1 = 'assets/imagenes/podio/Podio1Activo.jpg';
        imagen2 = 'assets/imagenes/podio/Podio2Inactivo.jpg';
        imagen3 = 'assets/imagenes/podio/Podio3Inactivo.jpg';
        opacidadNivel1 = 1.0;
        opacidadNivel2 = 0.0;
        opacidadNivel3 = 0.0;
        dimensionBotonOro = 60.0;
        dimensionBotonPlata = 50.0;
        dimensionBotonBronce = 50.0;
        colorBotonOro = colorAzulOpaco;
        colorBotonPlata = Colors.blueGrey[50];
        colorBotonBronce = Colors.blueGrey[50];
      } else if (nivel == 2) {
        imagen1 = 'assets/imagenes/podio/Podio12Activo.jpg';
        imagen2 = 'assets/imagenes/podio/Podio2Activo.jpg';
        imagen3 = 'assets/imagenes/podio/Podio3Inactivo.jpg';
        opacidadNivel1 = 0.0;
        opacidadNivel2 = 1.0;
        opacidadNivel3 = 0.0;
        dimensionBotonOro = 50.0;
        dimensionBotonPlata = 60.0;
        dimensionBotonBronce = 50.0;
        colorBotonOro = Colors.blueGrey[50];
        colorBotonPlata = colorAzulOpaco;
        colorBotonBronce = Colors.blueGrey[50];
      } else if (nivel == 3) {
        imagen1 = 'assets/imagenes/podio/Podio13Activo.jpg';
        imagen2 = 'assets/imagenes/podio/Podio2Inactivo.jpg';
        imagen3 = 'assets/imagenes/podio/Podio3Activo.jpg';
        opacidadNivel1 = 0.0;
        opacidadNivel2 = 0.0;
        opacidadNivel3 = 1.0;
        dimensionBotonOro = 50.0;
        dimensionBotonPlata = 50.0;
        dimensionBotonBronce = 60.0;
        colorBotonOro = Colors.blueGrey[50];
        colorBotonPlata = Colors.blueGrey[50];
        colorBotonBronce = colorAzulOpaco;
      }
    });
  }

  Widget constuccionImagenPodio(
      String imagen, int nivel, double anchoImagen, double alturaImagen) {
    return Container(
      width: anchoImagen,
      height: alturaImagen,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagen),
        ),
      ),
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        onPressed: () {
          _accionSeleccionNivel(nivel);
        },
        child: null,
      ),
    );
  }

  Widget construccionAnimacion(double opacidad, String animacion) {
    return AnimatedOpacity(
      opacity: opacidad,
      duration: Duration(seconds: 0),
      child: Container(
        width: 60,
        height: 100,
        child: FlareActor(
          "assets/animaciones/PersonajePodio.flr",
          animation: animacion,
          alignment: Alignment.bottomCenter,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget construccionPodio(String imagen, double anchoImagen,
      double alturaImagen, int nivel, double opacidad, String animacion) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        construccionAnimacion(opacidad, animacion),
        constuccionImagenPodio(imagen, nivel, anchoImagen, alturaImagen)
      ],
    );
  }

  Widget construccionBotonNivel(
      String medalla, int nivel, double dimensionBoton, Color colorBoton) {
    return Container(
      width: dimensionBoton,
      height: dimensionBoton,
      child: MaterialButton(
        elevation: 10.0,
        color: colorBoton,
        shape: CircleBorder(),
        splashColor: Colors.white54,
        child: Image(
          image: AssetImage(medalla),
          height: dimensionBoton-20,
          width: dimensionBoton-20,
        ),
        onPressed: () {
          _accionSeleccionNivel(nivel);
        },
      ),
    );
  }

  Widget podio() {
    return Container(
      width: 202,
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          construccionPodio(imagen2, 62.8, 63.2, 2, opacidadNivel2, animacion2),
          construccionPodio(imagen1, 79.0, 90.0, 1, opacidadNivel1, animacion1),
          construccionPodio(imagen3, 60.0, 55.0, 3, opacidadNivel3, animacion3)
        ],
      ),
    );
  }

  Widget botonesNivel() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          construccionBotonNivel(medallaPlata, 2, dimensionBotonPlata, colorBotonPlata),
          SizedBox(width: 20),
          construccionBotonNivel(medallaOro, 1, dimensionBotonOro, colorBotonOro),
          SizedBox(width: 20),
          construccionBotonNivel(medallaBronce, 3, dimensionBotonBronce, colorBotonBronce),
        ],
      ),
    );
  }

  // Método Contenido Gráfico
  @override
  Widget build(BuildContext contexto) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            botonesNivel(),
            podio(),
          ],
        ),
      ),
    );
  }
}
