
import 'dart:io';

abstract class Dispositivo {
  String nome;
  Dispositivo(this.nome);

  void ligar(double? a);
}

class Lampada extends Dispositivo {
  double? intensidade;
  Lampada(this.intensidade, String nome) : super(nome);

  @override
  void ligar(double? a) {
    print("A lampada chama $nome e tem $intensidade de intensidade");
  }
}

class ArCondicionado extends Dispositivo {
  double? graus;
  ArCondicionado(this.graus, String nome) : super(nome);

  @override
  void ligar(double? a) {
    print("O ar chama $nome e esta a $graus celsius");
  }
}

void main() {
  int? opcao;
  while (true) {
    stdout.write(
      "Digite 1 para pagar configurar uma lampada e 2 para pconfigurar um ar condiconado",
    );
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
    double? intensidade;
    while (true) {
      stdout.write("Digite a intensidade da lampada, entre 0 e 100");
      double? intensidade = double.parse(stdin.readLineSync()!);
      try {
        if (intensidade > 100 || intensidade < 0) {
          throw Exception('Intensidade invalida, digite outra intensidade');
        } else {
          break;
        }
      } catch (e) {
        print(e);
      }
    }
    stdout.write("Digite um apelido carinhoso para a lampada");
    String? nome = stdin.readLineSync()!;
    Lampada primeiraLampada = Lampada(intensidade, nome);

    primeiraLampada.ligar(intensidade);
  }
  else{
    double? temperatura;
    while (true) {
      stdout.write("Digite a temperatura entre 15 e 31");
      double? temperatura = double.parse(stdin.readLineSync()!);
      try {
        if (temperatura > 30 || temperatura < 16) {
          throw Exception('temperatura invalida, digite outra temperatura');
        } else {
          break;
        }
      } catch (e) {
        print(e);
      }
    }
    stdout.write("Digite um apelido carinhoso para a lampada");
    String? nome = stdin.readLineSync()!;
    ArCondicionado primeiroAr = ArCondicionado(temperatura, nome);

    primeiroAr.ligar(temperatura);
  }
}

