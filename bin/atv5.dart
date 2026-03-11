import 'dart:io';

abstract class Usuario {
  String? login;
  Usuario(this.login);

  void acessar();
}

class Gratuita extends Usuario {
  Gratuita(String? login) : super(login);

  @override
  void acessar() {
    print(" Acesso limitado. Assine o Premium para ver mais");
  }
}

class Premium extends Usuario {
  DateTime dataExpiracao;
  Premium(String? login, this.dataExpiracao) : super(login);

  @override
  void acessar() {
    if (dataExpiracao.isAfter(DateTime.now())) {
      print(
          "Acesso liberado! Bem-vindo [login] Sua assinatura expira em: $dataExpiracao .");
    } else {
      print("Erro: Sua assinatura expirou em [data]! Renove seu plano.");
    }
  }
}

void validarAcesso(Usuario u) {
  print("verificando sua conta");
  u.acessar();
}

void main(List<String> args) {
  stdout.write("Digite o seu login");
  String? login = stdin.readLineSync()!;
  int? opcao;
  while (true) {
    stdout.write(
        "Digite 1 para criar uma conta normal e 2 para uma conta premium");
    int? opcao = int.parse(stdin.readLineSync()!);
    try {
      if (opcao == 1 || opcao == 2) {
        break;
      } else {
        print("opcao invalida");
      }
    } catch (e) {
      print("e");
    }
  }

  if (opcao == 1) {
    Gratuita plano = Gratuita(login);
    validarAcesso(plano);
  } else {
    print(
        "ok, agora digite a data de expircao no formato data -> AAAA-MM-DD (Ex: 2026-12-31)");
    while (true) {
      stdout.write("Digite a data a seguir \n");
      DateTime? dataExpiracao = DateTime.parse(stdin.readLineSync()!);
      Premium plano = Premium(login, dataExpiracao);
      validarAcesso(plano);
    }
  }
}
