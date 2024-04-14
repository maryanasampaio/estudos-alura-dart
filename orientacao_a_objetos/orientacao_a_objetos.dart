import 'dart:io';

// IDENTIFICANDO PROGRAMAÇÃO ORIENTADA A OBJETOS

// exemplo criando objeto - COM CLASSE!
class Gato {
  Gato(
    this.nome,
    this.peso,
    this.cor,
    this.idade,
    this.isFofo,
  );
  String nome;
  double peso;
  String cor;
  int idade;
  bool? isFofo;

  GatoEhFofo() {
    if (isFofo!) {
      print('o gatinho é muito fofo!');
    } else {
      print('o gatinho é bravo!');
    }
  }

  todasAsCaracteristicasDoGato() {
    print(
        'o meu gato $nome, pesa $peso kg, é da cor $cor, possui $idade anos de idade e se ele é fofo? $isFofo');
  }
}

void main(List<String> args) {
  //chamando classe
  Gato garfield = Gato('Garfield', 6.5, "Laranja", 4, true);
  garfield.todasAsCaracteristicasDoGato();

  //proximo: exemplos de criação de objetos simples - SEM CLASSE!

  //Garfield
  String nome1 = "Garfield";
  double peso1 = 6.5; //kg
  String cores1 = "Laranja";
  int idade1 = 4;
  bool isFofo1;

//Artemis
  String nome2 = "Artemis";
  double peso2 = 3.150;
  String cores2 = "Branca";
  int idade2 = 5;
  bool isFofo2;

//Jiraya
  String nome3 = "Jiraya";
  double peso3 = 3.3;
  String cores3 = "Preto e Amarelo";
  int idade3 = 6;
  bool isFofo3;

  //exercicio de input e output:

  print("qual é seu nome?"); //saida = outout
  String? nome = stdin.readLineSync(); //entrada = input
  print("qual sua idade?");
  String? idade = stdin.readLineSync();
  print("qual sua altura?");
  String? altura = stdin.readLineSync();
  print("qual seu peso?");
  String? peso = stdin.readLineSync();

  int idadeint = int.parse(idade!);
  double alturadouble = double.parse(altura!);
  double pesodouble = double.parse(peso!);

  if (nome != null || idade != '' || altura != '' || peso != '') {
    print(
      "seu nome é $nome, você tem: $idadeint de idade, possui $alturadouble de altura e pesa $pesodouble",
    );
  }
}
