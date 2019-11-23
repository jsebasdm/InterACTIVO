// Crear lista de valores espaciados en un rango
List<double> crearListaRango({int totalValores, double limiteA, double limiteB, bool orden = true}) {
  double minimo = (orden) ? limiteA : limiteB;
  double maximo = (orden) ? limiteB : limiteA;
  List listaRango = List<double>(totalValores);
  listaRango[0] = minimo;
  double incremento = (maximo - minimo) / (totalValores - 1);
  for (int indice = 1; indice < totalValores; indice++) {
    listaRango[indice] = listaRango[indice - 1] + incremento;
  }
  return listaRango;
}