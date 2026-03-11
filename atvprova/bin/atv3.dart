import 'dart:io';

abstract class Veiculo {
  String placa;
  Veiculo(this.placa);

  void RealizarVistoria();
}

class Carro extends Veiculo {
  String portas;
  Carro(this.portas, placa) : super(placa);

  @override
  void RealizarVistoria() {
    print("Carro com $portas portas passou pela vistoria");
  }
}

class Moto extends Veiculo {
  String cilindradas;
  Moto(this.cilindradas, placa) : super(placa);

  @override
  void RealizarVistoria() {
    print("Moto com $cilindradas cilindradas passou pela vistoria");
  }
}

bool BuscarVeiculo(String a, List<Veiculo> oficina) {
  for (Veiculo v in oficina) {
    if (v.placa == a) {
      print("Veículo encontrado");
      v.RealizarVistoria();
      return true;
    }
  }

  print("Veículo não encontrado");
  return false;
}

void main(List<String> args) {
  List<Veiculo> oficina = [];
  int? opcao;
  int cont = 0;
  while (cont != 3) {
    while (true) {
      stdout.write("Digite 1 registrar um Carro e 2 para registrar uma moto");
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
      stdout.write("Digite quantas portas tem o carro");
      String? portas = stdin.readLineSync()!;
      stdout.write("Digite a placa do carro");
      String? placa = stdin.readLineSync()!;
      Carro carro = Carro(portas, placa);
      oficina.add(carro);
    } else {
      stdout.write("Digite quantas cilindradas tem o carro");
      String? cilindradas = stdin.readLineSync()!;
      stdout.write("Digite a placa do carro");
      String? placa = stdin.readLineSync()!;
      Moto moto = Moto(cilindradas, placa);

      oficina.add(moto);
    }
    cont += 1;
  }

  print("Agora digite uma placa para realizarmos a busca do produto");
  stdout.write("");
  String? placa = stdin.readLineSync()!;
  BuscarVeiculo(placa, oficina);
}
