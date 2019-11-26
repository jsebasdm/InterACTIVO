// Librerías
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';

// Archivos Externos
import 'package:interactivo/Utilidades/Constantes.dart';

// Clase Página Ingreso
class PaginaIngreso extends StatefulWidget {
  EstadoPaginaIngreso createState() => EstadoPaginaIngreso();
}

// Estado Página Ingreso
class EstadoPaginaIngreso extends State<PaginaIngreso> {
  // Método Navegar Galería (Tras Login Exitoso)
  void navegarPaginaPrimerHabilidad() => Navigator.pushNamed(context, 'HabilidadUno');

  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    // Lista Elementos Página
    final columnaElementos = Column(
      mainAxisSize: MainAxisSize.max,
      children: [StackIconosLogin(), SizedBox(height: 60), FormularioLogin(navegarLoginExitoso: navegarPaginaPrimerHabilidad)],
    );
    // Scaffold Página
    final vistaDeslizable = Center(child: SingleChildScrollView(child: columnaElementos, padding: EdgeInsets.all(20)));
    final stackContenido = Stack(children: [DecoracionFondo(), FilaIconoInterGrupo(), vistaDeslizable]);
    return Scaffold(body: SafeArea(child: stackContenido));
  }
}

// Contenedor Decoración Fondo Login
class DecoracionFondo extends StatelessWidget {
  Widget build(BuildContext contexto) {
    final filtroFondo = ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop);
    final imagenFondo = AssetImage('assets/imagenes/FondoLogin.jpg');
    final imagenDecoracion = DecorationImage(fit: BoxFit.cover, colorFilter: filtroFondo, image: imagenFondo);
    final contenedorFondo = Container(decoration: BoxDecoration(image: imagenDecoracion));
    final alturaPantalla = MediaQuery.of(contexto).size.height;
    return Positioned(top: 0, left: 0, right: 0, height: alturaPantalla, child: contenedorFondo);
  }
}

// Clase Fila Ícono InterGrupo
class FilaIconoInterGrupo extends StatelessWidget {
  Widget build(BuildContext contexto) {
    final iconoLogoInterGrupo = SvgPicture.asset('assets/graficos/LogoInterGrupo.svg', width: 48);
    final filaLogo = Row(children: [iconoLogoInterGrupo], mainAxisAlignment: MainAxisAlignment.end);
    return Container(child: filaLogo, padding: EdgeInsets.all(10));
  }
}

// Clase Stack Íconos Login: Dibujo + Logo
class StackIconosLogin extends StatelessWidget {
  Widget build(BuildContext contexto) {
    // Logo InterActivo
    final iconoLogoInterActivo = SvgPicture.asset('assets/graficos/LogoInterActivo.svg', width: 130);
    final logoInterActivo = Container(child: iconoLogoInterActivo, alignment: Alignment.bottomRight);

    // Imagen Login
    final imagenDibujoLogin = Image(image: AssetImage('assets/imagenes/DibujoLogin.png'), width: 150);
    final dibujoLogin = Container(child: imagenDibujoLogin, alignment: Alignment.topLeft);

    // Contenedor Combinado: Dibujo + Logo
    final stackIconos = Stack(children: [logoInterActivo, dibujoLogin]);
    return Center(child: Container(width: 220, height: 190, child: stackIconos));
  }
}

// Clase Borde Campo Formulario
class BordeCampo extends OutlineInputBorder {
  BordeCampo({Color color = Colors.black, double grosor = 1, double radio = 5})
      : super(borderSide: BorderSide(color: color, width: grosor), borderRadius: BorderRadius.circular(radio));
}

// Clase Campo Formulario
class CampoFormulario extends StatelessWidget {
  // Atributos
  final IconData icono;
  final String etiqueta;
  final Function validacion;
  final TextInputType teclado;
  final bool oculto;

  // Constructor
  CampoFormulario({this.icono, this.etiqueta, this.validacion, this.teclado = TextInputType.text, this.oculto = false});

  // Método Contenido Gráfico
  Widget build(BuildContext context) {
    final decoracion = InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      prefixIcon: Icon(icono, color: colorAzulOpaco, size: 32),
      labelText: etiqueta,
      labelStyle: TextStyle(color: colorAzulOpaco),
      filled: true,
      fillColor: Colors.white70,
      border: BordeCampo(),
      focusedBorder: BordeCampo(color: colorAzulOpaco, grosor: 2),
      errorStyle: estiloValidaciones,
    );
    return TextFormField(
        validator: validacion, style: estiloCampos, keyboardType: teclado, decoration: decoracion, obscureText: oculto);
  }
}

// Clase Botón Ingresar Formulario
class BotonIngresar extends StatelessWidget {
  // Atributos
  final Function clickBoton;
  // Constructor
  BotonIngresar({this.clickBoton});
  // Método Contenido Gráfico
  Widget build(BuildContext context) {
    final textoBoton = Text("Ingresar", textAlign: TextAlign.center, style: estiloBoton);
    final interiorBoton = MaterialButton(onPressed: clickBoton, child: textoBoton);
    final radioBorde = BorderRadius.circular(10);
    return Material(elevation: 5, borderRadius: radioBorde, color: colorAzulOpaco, child: interiorBoton);
  }
}

// Clase Switch Recordarme
class SwitchRecordarme extends StatelessWidget {
  // Atributos
  final Function funcionClickSwitch;
  final bool activo;

  // Constructor
  SwitchRecordarme({this.funcionClickSwitch, this.activo});

  // Método Auxiliar Switch
  funcionCambioSwitch(bool valor) => funcionClickSwitch();

  // Método Contenido Gráfico
  Widget build(BuildContext context) {
    final texto = Text('Recordarme', style: estiloCampos.copyWith(fontSize: 16), textAlign: TextAlign.left);
    final textoAlineado = Align(child: texto, alignment: Alignment(-1.1, 0));
    final interruptor = Switch(activeColor: colorAzulOpaco, value: activo, onChanged: funcionCambioSwitch);
    final fila = ListTile(
        contentPadding: EdgeInsets.zero, leading: interruptor, title: textoAlineado, onTap: funcionClickSwitch);
    return Container(child: fila, color: Colors.white30);
  }
}

// Clase Formulario Login
class FormularioLogin extends StatefulWidget {
  // Atributos
  final Function navegarLoginExitoso;
  // Constructor
  FormularioLogin({this.navegarLoginExitoso});
  // Método Crear Estado
  EstadoFormularioLogin createState() => EstadoFormularioLogin();
}

// Estado Formulario
class EstadoFormularioLogin extends State<FormularioLogin> {
  // Atributos
  final llaveFormulario = GlobalKey<FormState>();

  // Campos Estado
  bool recordarme = false;
  bool primerEnvio = false;

  // Método Actualizar Estado
  void actualizarEstado() => setState(() {});

  // Método Click Switch Recordarme
  void clickSwitch() {
    recordarme = !recordarme;
    actualizarEstado();
  }

  // Método Click Botón
  void clickBoton() {
    // Comenzar validaciones ante cambios
    primerEnvio = true;
    // Validar Fomulario: Si es válido, mostrar mensaje de éxito y navegar a página de galería de habilidades
    if (llaveFormulario.currentState.validate()) {
      FocusScope.of(context).requestFocus(FocusNode()); // Esconder teclado
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Tus datos son válidos (¡qué cosa tan arrecha!)')));
      Future.delayed(Duration(seconds: 2), navegarSiguientePagina);
    }
  }

  // Método Validación Correo
  String validacionCorreo(String valor) {
    // Validación Campo Vacío
    if (valor.isEmpty) return 'Por favor ingresa tu correo corporativo';
    // Validación Formato Correo
    if (!RegExp(r'.+@.+\..+').hasMatch(valor)) return 'El correo no cumple con el formato';
    return null;
  }

  // Método Validación Clave
  String validacionClave(String valor) {
    // Validación Campo Vacío
    if (valor.isEmpty) return 'Por favor ingresa tu contraseña';
    return null;
  }

  // Método Validar Formulario Completo
  void revalidarFormulario() {
    if(primerEnvio) llaveFormulario.currentState.validate();
  }

  // Método Navegar Siguiente Página
  void navegarSiguientePagina() {
    Scaffold.of(context).hideCurrentSnackBar();
    widget.navegarLoginExitoso();
  }

  // Método Contenido Gráfico
  Widget build(BuildContext context) {
    // Campos Formulario: Correo
    final teclado = TextInputType.emailAddress;
    final campoCorreo = CampoFormulario(
        etiqueta: 'Correo Corporativo', icono: LineIcons.envelope, teclado: teclado, validacion: validacionCorreo);

    // Campo Formulario: Clave
    final campoClave =
    CampoFormulario(etiqueta: 'Contraseña', icono: LineIcons.key, oculto: true, validacion: validacionClave);

    // Elementos Entrada: Switch y Botón Ingresar
    final filaSwitch = SwitchRecordarme(activo: recordarme, funcionClickSwitch: clickSwitch);
    final botonIngresar = BotonIngresar(clickBoton: clickBoton);

    // Lista Elementos Formulario
    final listaElementos = [
      campoCorreo,
      SizedBox(height: 20),
      campoClave,
      SizedBox(height: 10),
      filaSwitch,
      SizedBox(height: 20),
      botonIngresar,
    ];

    // Columna Formulario
    final columnaFormulario = Column(
        mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: listaElementos);
    // Formulario
    return Form(key: llaveFormulario, child: columnaFormulario, onChanged: revalidarFormulario);
  }
}
