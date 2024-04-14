// ERROS E EXCEÇÕES

class Account {
  String name;
  double balance;
  bool isAuthenticated;

  Account(
      {required this.name,
      required this.balance,
      required this.isAuthenticated});

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
      return false;
    }

    // Verificar se ID de destinatário é válido
    if (!verifyId(idReceiver)) {
      return false;
    }

    Account accountSender = _database[idSender]!;
    Account accountReceiver = _database[idReceiver]!;

    // Verificar se o remetente está autenticado
    if (!accountSender.isAuthenticated) {
      return false;
    }

    // Verificar se o remetente possui saldo suficiente
    if (accountSender.balance < amount) {
      return false;
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

//ex de pilha de execução
startTest() {
  int i = 0;
  print("Started Main");
  function01();
  print("Finished Main");
}

function01() {
  int j = 25;
  print("Started F01");
  try {
    function02(j);
    //tratando com cath
  } catch (e, s) {
    print(e.toString());
    print(s);
    rethrow;
    //tratando com rethrow e finally
  } finally {
    print(
        "Essa linha será executada independente de se capturar ou não o erro.");
  }

  print("Finished F01");
}

function02(int otherJ) {
  print("Started F02");

  for (int i = 1; i <= 5; i++) {
    print(i);
    //inserindo erro formatException
    double amount = double.parse("Not a number.");
  }
  otherJ = 50;
  print("Finished F02");
}

void main() {
  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Marcela",
      account:
          Account(name: "Marcela Santos", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Carlos",
      account:
          Account(name: "Carlos Santos", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  bool result = bankController.makeTransfer(
      idSender: "Carlos", idReceiver: "Marcela", amount: 700);

  // Observando resultado
  print(result);
}

// resultado = false, pois não possui esse valor dentro da conta de kako.