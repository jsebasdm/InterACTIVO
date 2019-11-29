// Clase: Valor parte de una Lista (contiene valor y si el índice en la lista es o no par)
class ValorRango {
  // Atributos
  double valor;
  bool esIndicePar;
  // Constructor
  ValorRango({this.valor, this.esIndicePar});
  // Métodos
  toString() => 'Valor: $valor, esIndicePar: $esIndicePar';

  // Función: Crear lista de elementos en rango, en incrementos constantes
  static List<ValorRango> crearListaRango({int totalValores, double limiteA, double limiteB, bool orden = true}) {
    double minimo = (orden) ? limiteA : limiteB;
    double maximo = (orden) ? limiteB : limiteA;
    List listaRango = List<ValorRango>(totalValores);
    listaRango[0] = ValorRango(valor: minimo, esIndicePar: true);
    double incremento = (maximo - minimo) / (totalValores - 1);
    for (int indice = 1; indice < totalValores; indice++) {
      double valor = listaRango[indice - 1].valor + incremento;
      bool esIndicePar = (indice % 2 == 0);
      listaRango[indice] = ValorRango(valor: valor, esIndicePar: esIndicePar);
    }
    return listaRango;
  }
}

// Clase: Formato Fechas
class FormatoFechas {
  // Constantes
  static const mapaMeses = {
    1: 'Enero',
    2: 'Febrero',
    3: 'Marzo',
    4: 'Abril',
    5: 'Mayo',
    6: 'Junio',
    7: 'Julio',
    8: 'Agosto',
    9: 'Septiembre',
    10: 'Octubre',
    11: 'Noviembre',
    12: 'Diciembre',
  };

  // Métodos
  static String interpretarFecha(DateTime fecha) {
    String mes = mapaMeses[fecha.month];
    return '$mes ${fecha.day}, ${fecha.year}';
  }
}
