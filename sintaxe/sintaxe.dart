//ENTENDENDO ENUM
enum Transporte {
  carro,
  bicicleta,
  onibus,
  aviao,
  andando,
  helicoptero,
  patins,
  skate,
}

class Viajar {
  Transporte locomocao;

  Viajar({required this.locomocao});

  int visitas = 0;
  static int _viagens = 0;

  void visitar() {
    visitas++;
    _viagens++;
    print(
        'Você visitou esse lugar $visitas vezes \n Você já fez um total de $_viagens viagens \n');
  }

  //usando getter
  int get numeroDeViagens {
    // permite apenas acessar o dado privado
    return _viagens;
  }

//usando setter
  set alterarViagens(int novoValor) {
    if (novoValor < visitas) {
      print(
          'O valor de viagens total é menor que o valor de visitas ao local selecionado, isso não faz sentido. Alterando o valor desejado para o valor padrão');
      _viagens = visitas;
    } else {
      _viagens = novoValor;
    }
  }

// exemplo sem enum
  void aventura() {
    if (locomocao == 1) {
      print('Estou indo numa Aventura de Carro!');
    } else if (locomocao == 2) {
      print('Estou indo numa Aventura de Carro!');
    } else if (locomocao == 3) {
      print('Estou indo numa Aventura de Carro!');
    } else {
      print('Estou indo numa Aventura!');
    }
  }

//exemplo com enum e switch
  void aventura2() {
    switch (locomocao) {
      case Transporte.carro:
        print('Estou indo numa Aventura de Carro!');
        break;
      case Transporte.bicicleta:
        print('Estou indo numa Aventura de Bike!');
        break;
      case Transporte.onibus:
        print('Estou indo numa Aventura de Busão!');
        break;
      case Transporte.aviao:
        print('Estou indo numa Aventura de Avião!');
        break;
      case Transporte.andando:
        print('Estou indo numa Aventura a Pé!');
        break;
      case Transporte.helicoptero:
        print('Estou indo numa Aventura de Helicóptero!');
        break;
      case Transporte.patins:
        print('Estou indo numa Aventura de Patins!');
        break;
      case Transporte.skate:
        print('Estou indo numa Aventura de Skate!');
        break;
      default:
        {
          print('Estou indo numa Aventura!');
        }
    }
  }
}

class Qualquer {
  Qualquer();
  final int _qualquerCoisa = 2;

  int get consultarQualquerCoisa {
    return _qualquerCoisa;
  }
}

void main(List<String> arguments) {
  Viajar jalapao = Viajar(locomocao: Transporte.carro);
  jalapao.aventura(); // codigo sem enum
  jalapao.aventura2(); // codigo com enum

  //Variáveis Static
  jalapao.visitar();
  jalapao.visitar();
  jalapao.visitar();

  // ENTENDENDO SET

// exemplo sem uso do set: elementos podem se repetir
  List<String> destinos = [
    'Jalapão',
    'Chapada dos Veadeiros',
    'João Pessoa',
    'Chapada dos Veadeiros'
  ];
  print(destinos);

// exemplo usando o set, elementos não podem se repetir
  Set destinosVisitados = <String>{
    'Rio de Janeiro',
    'Chapada dos Veadeiros',
    'São Paulo',
    'Chapada dos Veadeiros',
  };
  print(destinosVisitados);

  Set destinosDesejados = <String>{
    'Jalapão',
    'Califórnia',
    'Gramado',
    'Chapada Diamantina',
    'São Paulo'
  };
  print(destinosDesejados.intersection(destinosVisitados));

//ENTENDENDO MAP
  Map<String, String> motivoMap = {
    'Jalapão': 'Natureza',
    'Califórnia': 'Arte',
    'Gramado': 'Chocolate',
    'Chapada Diamantina': 'Cachoeiras',
    'São Paulo': 'Compras',
  };

  print(motivoMap);

  Map<String, dynamic> precoMap = {
    'Jalapão': 2380.00,
    'Califórnia': 'MUITO CARO',
    'Gramado': 1200,
    'Chapada Diamantina': 600,
    'São Paulo': 'Barato',
  };
  print(precoMap);

  // Variaveis Dynamic
  var precoX = 1; //
  print(precoX.runtimeType); //entende que é variavel do tipo int ou double
  // x = "frase"; -> vai brigar com a gente porque não podemos alterar a tipagem.

  dynamic precoY; // não sabe o tipo
  precoY = 1; // agora é um int
  print(precoY.runtimeType);
  precoY = 'frase'; // agora é uma String
  print(precoY.runtimeType);
}
