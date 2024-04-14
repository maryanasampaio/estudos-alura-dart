//ENTENDENDO HERANÇA

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  void printAlimento() {
    print("Este/a $nome pesa $peso gramas e é $cor.");
  }
}

class Legume extends Alimento {
  bool isPrecisaCozinhar;

  Legume(super.nome, super.peso, super.cor, this.isPrecisaCozinhar);

  void cozinhar() {
    (isPrecisaCozinhar)
        ? print("Pronto, o $nome está cozinhado!")
        : print("Nem precisou cozinhar");
  }
}

class Fruta extends Alimento {
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Fruta(
      String nome, double peso, String cor, this.sabor, this.diasDesdeColheita,
      {this.isMadura})
      : super(nome, peso, sabor);

  void estaMadura(int diasParaMadura) {
    isMadura = diasDesdeColheita >= diasParaMadura;
    print('A sua $nome foi colhida a $diasDesdeColheita dias e precisa de'
        ' $diasParaMadura dias para poder comer!'
        'Ela está Madura? $isMadura');
  }

  void fazerSuco() {
    print("Você fez um ótimo suco de $nome");
  }
}

class Citricas extends Fruta {
  double nivelAzedo;

  Citricas(super.nome, super.peso, super.cor, super.sabor,
      super.diaDesdeColheita, this.nivelAzedo);

  void existeRefri(bool existe) {
    (existe)
        ? print("Existe refri de $nome")
        : print("Não existe refri de $nome");
  }
}

class Nozes extends Fruta {
  double porcentagemOleoNatural;

  Nozes(super.nome, super.peso, super.cor, super.sabor, super.diaDesdeColheita,
      this.porcentagemOleoNatural);
}

void main(List<String> args) {
  Fruta melancia = Fruta('Melancia', 1500.0, 'Verde', 'Doce', 40);
  melancia.estaMadura(43);

  Legume legume1 = Legume("Macaxeira", 1200, "Marrom", true);
  Fruta fruta1 = Fruta("Banana", 75, "Amarelo", 'doce', 7);
  Nozes noz1 = Nozes("Amendoim", 3.5, "Marrom", '', 12, 20);
  Citricas citrica1 = Citricas("Laranja", 200, "Laranja", 'azedo', 7, 60);

  legume1.printAlimento();

  fruta1.printAlimento();

  noz1.printAlimento();

  citrica1.printAlimento();

  legume1.cozinhar(); // Funciona

  // fruta1.cozinhar(); // Erro!

  //legume1.fazerSuco(); // Erro!

  fruta1.fazerSuco(); // Funciona!
}
