//EXCEPTIONS E TRATAMENTOS DE ERROS (tratando exception de excecoes.dart)

class Account {
  String name;
  double balance;
  bool isAuthenticated;
  DateTime? createdAt; //lidando com opcionais
  Account(
      {required this.name,
      required this.balance,
      required this.isAuthenticated,
      this.createdAt})
      : assert(name.isEmpty, 'Empty Name'), // tratando com assert
        assert(balance < 0, 'Negative Balance');

  editBalance({required value}) {
    balance = balance + value;
  }
}

class BankController {
  final Map<String, Account> _database = {};

  addAccount({required String id, required Account account}) {
    _database[id] = account;
  }

  bool makeTransfer(
      {required String idSender,
      required String idReceiver,
      required double amount}) {
    // Verificar se ID de remetente é válido
    if (!verifyId(idSender)) {
      throw SenderIdInvalidException(
          idSender:
              idSender); //antes era um bool e foi criado uma exception propria
    }

    // Verificar se ID de destinatário é válido
    if (!verifyId(idReceiver)) {
      throw ReceiverIdInvalidException(
          idReceiver:
              idReceiver); //antes era um bool e foi criado uma exception propria
    }

    Account accountSender = _database[idSender]!;
    Account accountReceiver = _database[idReceiver]!;

    // Verificar se o remetente está autenticado
    if (!accountSender.isAuthenticated) {
      throw SenderNotAuthenticatedException(
          idSender:
              idSender); //antes era um bool e foi criado uma exception propria
    }

    // Verificar se o destinatário está autenticado
    if (!accountReceiver.isAuthenticated) {
      throw ReceiverNotAuthenticatedException(
          idReceiver:
              idReceiver); //antes era um bool e foi criado uma exception propria
    }

    // Verificar se o remetente possui saldo suficiente
    if (accountSender.balance < amount) {
      throw SenderBalanceLowerThanAmountException(
          //antes era um bool e foi criado uma exception propria
          idSender: idSender,
          balanceSender: accountSender.balance,
          amount: amount);
    }

    // Se tudo estiver certo, efetivar transação
    accountSender.balance -= amount;
    accountReceiver.balance += amount;

    return true;
  }

  bool verifyId(String id) {
    return _database.containsKey(id);
  }
}

// criando exceptions proprias para cada verificação
class ReceiverNotAuthenticatedException implements Exception {
  static const String report = "ReceiverNotAuthenticatedException";

  String idReceiver;
  late String message;
  ReceiverNotAuthenticatedException({required this.idReceiver}) {
    message = "$report\nID Sender: $idReceiver";
  }

// sobrescrevendo o toString
  @override
  String toString() {
    return message;
  }
}

class SenderBalanceLowerThanAmountException implements Exception {
  static const String report = "SenderBalanceLowerThanAmountException";

  String idSender;
  double balanceSender;
  double amount;
  late String message;

  SenderBalanceLowerThanAmountException({
    required this.idSender,
    required this.balanceSender,
    required this.amount,
  }) {
    message =
        "$report\nID Sender: $idSender\nBalance Sender: $balanceSender\nAmount: $amount";
  }

  @override
  String toString() {
    return message;
  }
}

class SenderIdInvalidException implements Exception {
  static const String report = "SenderIdInvalidException";

  String idSender;
  late String message;
  SenderIdInvalidException({required this.idSender}) {
    message = "$report\nID Sender: $idSender";
  }

  @override
  String toString() {
    return message;
  }
}

class ReceiverIdInvalidException implements Exception {
  static const String report = "ReceiverIdInvalidException";

  String idReceiver;
  late String message;
  ReceiverIdInvalidException({required this.idReceiver}) {
    message = "$report\nID Receiver: $idReceiver";
  }

  @override
  String toString() {
    return message;
  }
}

class SenderNotAuthenticatedException implements Exception {
  static const String report = "SenderNotAuthenticatedException";

  String idSender;
  late String message;
  SenderNotAuthenticatedException({required this.idSender}) {
    message = "$report\nID Sender: $idSender";
  }

  @override
  String toString() {
    return message;
  }
}

void main() {
  //assert(3 > 4);
  //assert(3 > 4, "Que pena, 3 não é maior que 4");

  // Criando o banco
  BankController bankController = BankController();

  Account testAccount = Account(name: "", balance: 0, isAuthenticated: true);

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: false));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  try {
    bankController.makeTransfer(
        idSender: "Kako", idReceiver: "Ricarth", amount: 200);

    print("Transação concluída com sucesso");
  } on SenderIdInvalidException catch (e) {
    print(e.message);
  } on ReceiverIdInvalidException catch (e) {
    print(e);
  } on SenderNotAuthenticatedException catch (e) {
    print(e);
  } on ReceiverNotAuthenticatedException catch (e) {
    print(e);
  } on SenderBalanceLowerThanAmountException catch (e) {
    print(e);
  } catch (e) {
    print("Erro desconhecido.");
  }
}
