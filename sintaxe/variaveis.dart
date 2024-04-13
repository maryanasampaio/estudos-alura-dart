void main(List<String> args) {
  /// Comentário de Documentação
  /** Novo Comentário de Multiplas linhas **/

//tipos de variáveis
  int idade = 19;
  double altura = 1.68;
  bool geek = true;
  String novoNome = 'Maryana';

  // diferença de final e const
  const String nome = 'Maryana Sampaio';
  final String apelido;
  apelido = 'Mary';

  bool maiorDeIdade;
  int energia = 100;

//estrutura condicional if
  if (idade >= 18) {
    maiorDeIdade = true;
  } else {
    maiorDeIdade = false;
  }

// estrutura de repetição for
  for (int i = 1; i < 5; i = i + 2) {
    print('Concluí $i voltas');
  }

//estrutura de repetição while
  while (energia > 0) {
    print('Mais uma Repetição');
    energia = energia - 6;
  }

  ///Exemplo de outra forma de usar o While

  // do {
  //   print("Mais uma Repetição");
  //   energia = energia - 6;
  // } while (energia > 0);

// collections: lista
  List<dynamic> mary = [idade, altura, geek, nome, apelido];

  // pegando valores da lista usando indices
  String frase = 'Eu sou ${mary[4]} \n'
      'mas meu nome completo é: ${mary[3]}, \n'
      'eu me considero geek? ${mary[2]}. \n'
      'Eu tenho ${mary[1]} metros de altura e \n'
      '${mary[0]} anos de idade,\n'
      'Eu sou maior de idade? $maiorDeIdade';

  print(frase);
}
