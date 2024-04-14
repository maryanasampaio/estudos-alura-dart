import 'dart:async';
import 'dart:io';

void main() async {
//   //ENTENDENDO FUTURE e then

  Future myFuture = Future(() {
    print('Going back to the Future');
    return 21;
  }).then((value) => print('O resultado foi: $value'));

  Future<int> myFutureFunc() async {
    print('I have a function in the Future');
    await Future.delayed(Duration(seconds: 2));
    //throw Exception();
    return 12;
  }

//má prática
  myFutureFunc()
      .then((value) => print('O valor da função é: $value'))
      .onError((error, stackTrace) => print('An Error happend'))
      .whenComplete(() => print('The Future is Over'));

// boa prática
  Future<int> myFutureErrorFunc(int a, int b) async {
    try {
      if (a > b) {
        throw Exception(); //força exceção para teste
      }
      print('I am a Functional Function');
      await Future.delayed(Duration(seconds: 3));
      return 42;
    } catch (e) {
      print('An Error happend: $e');
      return 42;
    } finally {
      print('The Future is finally Over');
    }
  }

  myFutureErrorFunc(1, 2).then((value) => print('The value is: $value'));

  print('Done with main');

//meu teste

  // Future meuTeste() async {
  //   print('escreva seu nome:');
  //   String nome = stdin.readLineSync().toString();

  //   try {
  //     if (nome != "maryana") {
  //       print('processando...');
  //       await Future.delayed(Duration(seconds: 2));
  //       throw Exception();
  //     } else {
  //       await Future.delayed(Duration(seconds: 2));

  //       print('acessado!');
  //     }
  //   } catch (e) {
  //     print('tente mais tarde!');
  //   } finally {
  //     await Future.delayed(Duration(seconds: 2));

  //     print('encerrando conversa...');
  //   }
  //   await Future.delayed(Duration(seconds: 2));

  //   return nome;
  // }

  // meuTeste().then((nome) => print('até mais, $nome'));

// ENTENDENDO STRAMS
  Stream myStream(int interval, [int? maxCount]) async* {
    int i = 1;
    while (i != maxCount) {
      print("Counting: $i");
      await Future.delayed(Duration(seconds: interval));
      yield i++;
    }
    print('The Stream is finished');
  }

  var kakoStream = myStream(1).asBroadcastStream();
  StreamSubscription mySubscriber = kakoStream.listen((event) {
    if (event.isEven) {
      print('This number is Even!');
    }
  }, onError: (e) {
    print('An error happend: $e');
  }, onDone: () {
    print('The subscriber is gone.');
  });
  kakoStream.map((event) => 'Subscriber 2 watching: $event').listen(print);

  await Future.delayed(Duration(seconds: 3));
  mySubscriber.pause();
  print('Stream paused');
  await Future.delayed(Duration(seconds: 3));
  mySubscriber.resume();
  print('Stream resumed');
  await Future.delayed(Duration(seconds: 3));
  mySubscriber.cancel();
  print('Stream canceled');

  print('Main is finished');
}
