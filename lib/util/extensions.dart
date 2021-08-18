extension format on double  {
  String reais() {
    return "R\$ ${this.toStringAsFixed(2)}".replaceAll(".", ",");
  }
}