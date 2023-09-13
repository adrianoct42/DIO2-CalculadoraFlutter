class Imc {
  Imc(this._peso, this._altura);

  double? _peso;
  double? _altura;

  get peso => _peso;
  get altura => _altura;

  String imcString() {
    double imc = peso / (altura * altura);

    if (imc < 16) {
      return "${imc.toStringAsFixed(2)} - MAGREZA GRAVE";
    } else if (imc >= 16 && imc < 17) {
      return "${imc.toStringAsFixed(2)} - MAGREZA MODERADA";
    } else if (imc >= 17 && imc < 18.5) {
      return "${imc.toStringAsFixed(2)} - MAGREZA LEVE";
    } else if (imc >= 18.5 && imc < 25) {
      return "${imc.toStringAsFixed(2)} - SAUDÁVEL";
    } else if (imc >= 25 && imc < 30) {
      return "${imc.toStringAsFixed(2)} - SOBREPESO";
    } else if (imc >= 30 && imc < 35) {
      return "${imc.toStringAsFixed(2)} - OBESIDADE GRAU I";
    } else if (imc >= 35 && imc < 40) {
      return "${imc.toStringAsFixed(2)} - OBESIDADE GRAU II";
    } else {
      return "${imc.toStringAsFixed(2)} - OBESIDADE GRAU III";
    }
  }
}
