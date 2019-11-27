// Librería
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interactivo/Utilidades/Constantes.dart';

// Clase Página
class PrimerFormulario extends StatefulWidget {
  EstadoPrimerFormulario createState() => EstadoPrimerFormulario();
}

// Estado Página Ingreso
class EstadoPrimerFormulario extends State<PrimerFormulario> {
  @override
  Widget build(BuildContext contexto) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: SvgPicture.asset('assets/graficos/LogoInterActivo.svg',
                  width: 50, height: 50),
            ),
          ],
        ),
        Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Container(
                  child: FlareActor(
                    "assets/animaciones/Heroe.flr",
                    animation: 'Heroe',
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.contain,
                  ),
                  width: 170,
                  height: 170,
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('¡Eres mas hábil de lo que crees!',
                      textAlign: TextAlign.center, style: estilohabil),
                ),
                SizedBox(height: 50),
                Container(
                  width: 90,
                  child: MaterialButton(
                    elevation: 10.0,
                    splashColor: Colors.white54,
                    color: colorAzulOpaco,
                    shape: StadiumBorder(),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 40.0,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Agrega una habilidad',
                          style: estilohabilidad,
                        )
                      ],
                    ),
                    onPressed: () => Navigator.pushNamed(context, 'Formulario'),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        )
      ],
    );
  }
}
