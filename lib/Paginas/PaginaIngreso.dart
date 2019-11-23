// Librería
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interactivo/Utilidades/Constantes.dart';

// Clase Página, Widget de inicio PaginaIngreso.
class PaginaIngreso extends StatefulWidget {
  PaginaIngreso({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _EstadoPaginaIngreso createState() => _EstadoPaginaIngreso();
}

// Método Contenido Gráfico
class _EstadoPaginaIngreso extends State<PaginaIngreso> {
  TextStyle estiloCampos = TextStyle(fontFamily: 'Roboto', fontSize: 14);
  TextStyle estiloBoton =
      TextStyle(fontFamily: 'Roboto', fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold);
  bool valorCheckBox = false;

  // Métodos Auxiliares
  void actualizarEstado() => setState(() {});

  void metodoCasilla(bool valor) {
    valorCheckBox = valor;
    actualizarEstado();
  }

  // Casilla "Recordarme"
  Widget casilla() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Checkbox(value: valorCheckBox, onChanged: metodoCasilla, activeColor: colorAzulOpaco),
        Text('Recordarme', style: estiloCampos),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //Campo de ingreso de texto para digitar el correo corporativo
    final campoEmail = TextField(
      style: estiloCampos,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
          icon: Icon(Icons.account_circle, color: colorAzulOpaco, size: 35),
          labelText: "Correo Corporativo",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );

    //Campo de ingreso de texto para digitar la contraseña o clave
    final campoClave = TextField(
      obscureText: true,
      style: estiloCampos,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
          icon: Icon(Icons.lock, color: colorAzulOpaco, size: 35),
          labelText: "Contraseña",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );

    //Boton de login para dar inicio de sesion
    final botonLogin = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: colorAzulOpaco,
      child: MaterialButton(
        minWidth: 200.0,
        onPressed: () => Navigator.pushNamed(context, 'Pruebas'),
        child: Text("Ingresar", textAlign: TextAlign.center, style: estiloBoton),
      ),
    );

    //Scaffold que une todos los Widgets creados para la Pagina de ingreso
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
            image: AssetImage('assets/imagenes/FondoLogin.png'),
          ),
        ),
        child: ListView(
          children: <Widget>[
            Center(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(38.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 40.0),
                      SizedBox(
                        height: 90.0,
                        child: Image.asset(
                          "assets/imagenes/SloganLogin.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 140.0,
                        child: Image.asset(
                          "assets/imagenes/DibujoLogin.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 45.0),
                      campoEmail,
                      SizedBox(height: 25.0),
                      campoClave,
                      SizedBox(height: 15.0),
                      casilla(),
                      SizedBox(height: 15.0),
                      botonLogin,
                      SizedBox(height: 15.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
