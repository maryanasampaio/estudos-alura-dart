import 'dart:math';

import '../assincronismo/tratamento de erro.dart';

void testingNullSafety() {
  Account? myAccount =
      Account(name: "Maryana", balance: 300, isAuthenticated: true);

  Random rng = Random();
  if (rng.nextInt(10) % 2 == 0) {
    myAccount.createdAt = DateTime.now();
  }

  // Não funciona
  // print(myAccount.createdAt.day);

  // Funciona mas é má prática pois pode levantar erro
  // print(myAccount.createdAt!.day);

  if (myAccount.createdAt != null) {
    print(myAccount.createdAt?.day);
  } else {
    print("Data Nula");
  }

  // Explicar que é uma situação que válida encadear "?"
  // print(myAccount?.createdAt?.day); // Explicar warning Flow Analisys
  Account? otherAccount;
  // ignore: dead_code
  print(otherAccount?.createdAt?.day);
}

void main() {
  testingNullSafety();
}
