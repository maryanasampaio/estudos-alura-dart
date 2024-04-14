//ENTENDENDO POLIMORFISMO E CLASSE ABSTRATA

abstract class Bolo {
  void separarIngredientes();
  void fazerMassa();
  void assar();
}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  void printAlimento() {
    print("Este/a $nome pesa $peso gramas e é $cor.");
  }
}

class Fruta extends Alimento implements Bolo {
  int diaDesdeColheita;
  bool? isMadura;

  Fruta(super.nome, super.peso, super.cor, this.diaDesdeColheita,
      {this.isMadura});

  void fazerSuco() {
    print("Você fez um belo suco de $nome");
  }

  @override
  void separarIngredientes() {
    print("Catar a fruta");
  }

  @override
  void fazerMassa() {
    print("Mistura, mistura.");
  }

  @override
  void assar() {
    print("Por no forno!");
  }
}

class Legume extends Alimento implements Bolo {
  bool isPrecisaCozinhar;

  Legume(super.nome, super.peso, super.cor, this.isPrecisaCozinhar);

  void cozinhar() {
    (isPrecisaCozinhar)
        ? print("Pronto, o $nome está cozinhado!")
        : print("Nem precisou cozinhar");
  }

  @override
  void assar() {}

  @override
  void fazerMassa() {}

  @override
  void separarIngredientes() {}
}

class Citricas extends Fruta {
  double nivelAzedo;

  Citricas(super.nome, super.peso, super.cor, super.diaDesdeColheita,
      this.nivelAzedo);

  void existeRefri(bool existe) {
    (existe)
        ? print("Existe refri de $nome")
        : print("Não existe refri de $nome");
  }

  @override
  void fazerMassa() {
    print("Tirar sementes");
    super.fazerMassa();
  }
}

class Nozes extends Fruta {
  double porcentagemOleoNatural;

  Nozes(super.nome, super.peso, super.cor, super.diaDesdeColheita,
      this.porcentagemOleoNatural);

  @override
  void fazerMassa() {
    print("Tirar a casca");
    super.fazerMassa();
  }
}

class Animal {
  Animal(this.nome, this.especie, this.idade);
  String nome;
  String especie;
  int idade;
}

class AnimalSilvestre extends Animal {
  bool isAtaca;
  AnimalSilvestre(super.nome, super.especie, super.idade, this.isAtaca);
}

class AnimalDomestico extends Animal implements Cuidados {
  bool isFofo;
  bool? isCompra;

  int? preco;

  AnimalDomestico(super.nome, super.especie, super.idade, this.isFofo,
      {this.preco, this.isCompra});

  comprarAnimal() {
    if (isCompra!) {
      return ' este $nome está no valor de $preco!';
    } else {
      return 'esse animal está para a doação, não para a compra!';
    }
  }

  printAnimalDomestico() {
    return 'meu $nome é um $especie e atualmente tem $idade anos de idade, ele é fofo? $isFofo. se esta para a venda? $isCompra';
  }

  @override
  mandarParaPetShop(String data) {
    return 'o dia que está marcado para meu $nome ir ao petshop é dia $data';
  }

  @override
  comprarRacao(double kilos) {
    double umKg = 20.00;
    double valor = kilos * umKg;
    print('hoje é dia de comprar a ração do $nome');
    print('economizei e tenho $valor reais');
    print('vou comprar $kilos kg ou g de ração dessa vez!');
  }

  @override
  darCarinho() {
    return 'hora de dar carinho ao meu $nome';
  }
}

abstract class Cuidados {
  mandarParaPetShop(String data);

  comprarRacao(double kilos);

  darCarinho();
}

void main(List<String> args) {
  AnimalDomestico gato = AnimalDomestico('gato', 'mamifero', 10, true,
      isCompra: true, preco: 1000);
  print(gato.printAnimalDomestico());
  print(gato.comprarAnimal());

  print(gato.mandarParaPetShop('30/03/2014'));
  print(gato.comprarRacao(0.1));
  print(gato.darCarinho());
}
