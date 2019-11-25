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
  String imagen1 = 'assets/imagenes/imagenespodio/Podio1Inactivo.jpg';
  String imagen2 = 'assets/imagenes/imagenespodio/Podio2Inactivo.jpg';
  String imagen3 = 'assets/imagenes/imagenespodio/Podio3Inactivo.jpg';
  double opacidadNivel1 = 0.0;
  double opacidadNivel2 = 0.0;
  double opacidadNivel3 = 0.0;
  String animacion1 = 'PrimerPuesto';
  String animacion2 = 'SegundoPuesto';
  String animacion3 = 'TercerPuesto';
  String medallaOro = 'assets/imagenes/medallas/MedallaOro.png';
  String medallaPlata = 'assets/imagenes/medallas/MedallaPlata.png';
  String medallaBronce = 'assets/imagenes/medallas/MedallaBronce.png';

  void _onClicked(int level) {
    setState(() {
      //debugPrint('nivel $level');
      if (level == 1) {
        imagen1 = 'assets/imagenes/imagenespodio/Podio1Activo.jpg';
        imagen2 = 'assets/imagenes/imagenespodio/Podio2Inactivo.jpg';
        imagen3 = 'assets/imagenes/imagenespodio/Podio3Inactivo.jpg';
        opacidadNivel1 = 1.0;
        opacidadNivel2 = 0.0;
        opacidadNivel3 = 0.0;
      } else if (level == 2) {
        imagen1 = 'assets/imagenes/imagenespodio/Podio12Activo.jpg';
        imagen2 = 'assets/imagenes/imagenespodio/Podio2Activo.jpg';
        imagen3 = 'assets/imagenes/imagenespodio/Podio3Inactivo.jpg';
        opacidadNivel1 = 0.0;
        opacidadNivel2 = 1.0;
        opacidadNivel3 = 0.0;
      } else if (level == 3) {
        imagen1 = 'assets/imagenes/imagenespodio/Podio13Activo.jpg';
        imagen2 = 'assets/imagenes/imagenespodio/Podio2Inactivo.jpg';
        imagen3 = 'assets/imagenes/imagenespodio/Podio3Activo.jpg';
        opacidadNivel1 = 0.0;
        opacidadNivel2 = 0.0;
        opacidadNivel3 = 1.0;
      }
    });
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
          _onClicked(nivel);
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

  Widget botonesNivel(String medalla, int nivel) {
    return ClipOval(
      child: Container(
        width: 70,
        height: 70,
        child: Material(
          elevation: 20.0,
          color: colorAzulOpaco,
          shape: CircleBorder(),
          child: MaterialButton(
            child: Image(image: AssetImage(medalla), width: 50.0, height: 50.0),
            onPressed: () {
              _onClicked(nivel);
            },
          ),
        ),
      ),
    );
  }

  // Método Contenido Gráfico
  @override
  Widget build(BuildContext contexto) {
    return ListView(
      children: <Widget>[
        Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      botonesNivel(medallaPlata, 2),
                      botonesNivel(medallaOro, 1),
                      botonesNivel(medallaBronce, 3),
                    ],
                  ),
                ),
                Container(
                  width: 202,
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      construccionPodio(
                          imagen2, 62.8, 63.2, 2, opacidadNivel2, animacion2),
                      construccionPodio(
                          imagen1, 79.0, 90.0, 1, opacidadNivel1, animacion1),
                      construccionPodio(
                          imagen3, 60.0, 55.0, 3, opacidadNivel3, animacion3)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
