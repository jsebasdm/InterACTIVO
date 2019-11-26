// Librería
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
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SvgPicture.asset(
                        'assets/graficos/LogoInterActivo.svg',
                        width: 50,
                        height: 50),
                  ],
                ),
                Image(
                  image: AssetImage('assets/imagenes/Skills.jpg'),
                  width: 160,
                  height: 150,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Eres mas hábil de lo que crees', textAlign: TextAlign.center, style: estilohabil),
                ),
                SizedBox(height: 50),
                Container(
                  child: MaterialButton(
                    elevation: 10.0,
                    splashColor: Colors.white54,
                    color: colorAzulOpaco,
                    shape: CircleBorder(),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 80,
                    ),
                    onPressed: ()  => Navigator.pushNamed(context, 'Formulario'),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Agrega una habilidad',
                  style: estilohabilidad,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
