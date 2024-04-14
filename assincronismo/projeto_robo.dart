import 'dart:io';

class TimeQuestions {
  //determina perguntas padronizadas
  String hour = 'Que horas sao?';
  String day = 'Que dia e hoje?';
  String year = 'Em que ano estamos?';
  String question;
  DateTime date = DateTime.now();
  String maryBot = 'MaryBot:\n';
  bool isThisATimeQuestion = false;

  TimeQuestions(this.question);

  bool isThisTime() {
    //verificar se estamos numa pergunta sobre Tempo
    if (question.contains('horas') ||
        question.contains('Horas') ||
        question.contains('dia') ||
        question.contains('Dia') ||
        question.contains('ano') ||
        question.contains('Ano')) {
      isThisATimeQuestion = true;
    }
    return isThisATimeQuestion;
  }

//ao verificar anteriormente se há perguntas sobre tempo, aqui seleciona as respostas
  timeQuestion() {
    if (question == hour) {
      String botAnswer =
          '$maryBot Opa! são : ${date.hour} horas e ${date.minute} minutos!';
      print(botAnswer);
    } else if (question == day) {
      String botAnswer = '$maryBot Opa! hoje é dia : ${date.day}';
      print(botAnswer);
    } else if (question == year) {
      String botAnswer = '$maryBot Opa! estamos em : ${date.year}';
      print(botAnswer);
    } else {
      unsure();
    }
  }

// caso a escrita seja diferente
  unsure() {
    if (question.contains('horas') || question.contains('Horas')) {
      String botQuestion = '$maryBot Não entendi, você quer saber das horas?';
      print(botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {
        String botAnswer =
            '$maryBot Beleza, são : ${date.hour} horas e ${date.minute} minutos!';
        print(botAnswer);
      } else {
        String botAnswer = '$maryBot Ah, foi mal... entendi errado.';
        print(botAnswer);
      }
    } else if (question.contains('dia') || question.contains('Dia')) {
      String botQuestion =
          '$maryBot Não entendi, você quer saber que dia é hoje?';
      print(botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {
        String botAnswer = '$maryBot Beleza, hoje é dia: ${date.day}';
        print(botAnswer);
      } else {
        String botAnswer = '$maryBot Ah, foi mal... entendi errado.';
        print(botAnswer);
      }
    } else if (question.contains('ano') || question.contains('Ano')) {
      String botQuestion =
          '$maryBot Não entendi, você quer saber em que ano estamos?';
      print(botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {
        String botAnswer =
            '$maryBot Beleza, estamos no ano de 2077, a pandemia já está terminando... \n Brincadeirinha! estamos em : ${date.year}';
        print(botAnswer);
      } else {
        String botAnswer = '$maryBot Ah, foi mal... entendi errado.';
        print(botAnswer);
      }
    }
  }
}

//classe de boas maneiras
class GoodManners {
  String question;
  bool isThisGoodManners = false;
  String maryBot = 'MaryBot:\n';
  GoodManners(this.question);

// definindo palavras padronizadas
  bool isThisManners() {
    if (question.contains('oi') ||
        question.contains('ola') ||
        question.contains('Oi') ||
        question.contains('Ola') ||
        question.contains('obrigado') ||
        question.contains('obrigada') ||
        question.contains('Obrigado') ||
        question.contains('Obrigada') ||
        question.contains('bom') ||
        question.contains('boa') ||
        question.contains('tarde') ||
        question.contains('noite') ||
        question.contains('de nada') ||
        question.contains('De nada')) {
      isThisGoodManners = true;
    }
    return isThisGoodManners;
  }

  //resposta para as palavras padronizadas
  goodManners() {
    if (question.contains('Bom dia') || question.contains('bom dia')) {
      print('$maryBot Bom dia Flor do dia!');
    } else if (question.contains('Boa tarde') ||
        question.contains('boa tarde')) {
      print('$maryBot Opa sô, boa tarde!');
    } else if (question.contains('Boa noite') ||
        question.contains('boa noite')) {
      print('$maryBot Uma bela noite, não é mesmo?');
    } else if (question.contains('oi') ||
        question.contains('Oi') ||
        question.contains('Ola') ||
        question.contains('ola')) {
      print('$maryBot Muito prazer!');
    } else if (question.contains('obrigado') ||
        question.contains('Obrigado') ||
        question.contains('Obrigada') ||
        question.contains('obrigada')) {
      print('$maryBot De nada, fique a vontade c:');
    }
  }
}
// aplicando future

class BotClock {
  Future clock(int seconds) {
    return Future.delayed(Duration(seconds: seconds));
  }

// aplicando stream
  Stream maryBotStream(int interval, [int? maxCount]) async* {
    int i = 1;
    while (i != maxCount) {
      await Future.delayed(Duration(seconds: interval));
      yield i++;
    }
    print('A Stream terminou.');
  }
}

void main() async {
  // praticas de async await e future + aplicando stream

  String maryBot = 'KakoBOT:\n';
  var a = true;
  String usuario = '';

  var myStream = BotClock().maryBotStream(1, 10);
  var subscriber = myStream.listen((event) {
    print('                      MaryBot está ativo a: $event segundos');
  }, onDone: () {
    print('MaryBot está sendo finalizado! Faça a ultima pergunta.');
    a = false;
  });

  print('-- Iniciando o MaryBot, aguarde..--');
  await BotClock().clock(3);
  print('MaryBot:\n Oi :) \n Como posso ajudar?');
  do {
    usuario = stdin.readLineSync().toString();
    print('-- Processando pergunta, aguarde..--');
    await BotClock().clock(1);
    if (usuario.contains('xau') ||
        usuario.contains('Xau') ||
        usuario.contains('Adeus') ||
        usuario.contains('adeus')) {
      a = false;
      print('$maryBot Até a proxima!!');
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
      TimeQuestions(usuario).timeQuestion();
      await BotClock().clock(1);
    } else if (GoodManners(usuario).isThisManners()) {
      GoodManners(usuario).goodManners();
    } else if (false) {
      //Basta adicionar novas perguntas aqui!
    } else {
      await BotClock().clock(2);
      print(
          '$maryBot Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print('$maryBot Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a);

  print('--Encerrando KakoBOT--');
}
