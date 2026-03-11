import 'dart:io';

abstract class Encomenda {
  int codigo;
  double? peso;
  Encomenda(this.codigo, this.peso);

  void gerarEtiqueta(int a, int b);
}

//Encomenda [codigo] confirmada! Prazo de entrega: [prazo] dias

class EnvioNormal extends Encomenda {
  int prazo;
  EnvioNormal(this.prazo, int codigo, double? peso) : super(codigo, peso);

  @override
  void gerarEtiqueta(int codigo, int prazo) {
    print("Encomenda $codigo confirmada! Prazo de entrega: $prazo dias");
  }
}

class EnvioSedex extends Encomenda {
  int prazo;
  EnvioSedex(this.prazo, int codigo, double? peso) : super(codigo, peso);

  @override
  void gerarEtiqueta(int codigo, int prazo) {
    print("Encomenda $codigo confirmada! Prazo de entrega: $prazo dias");
  }
}

void Main() {
  stdout.write("Digite o codigo do produto");
  int? codigo = int.parse(stdin.readLineSync()!);
  int? opcao;
  while (true) {
    stdout.write("Digite 1 para envio normal e 2 para envio sedex");
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
  double? peso;
  while (true) {
    stdout.write("Digite o peso do produto");
    double? peso = double.parse(stdin.readLineSync()!);
    try {
      if (peso > 30) {
        print("Erro: O peso máximo permitido é 30kg");
      } else {
        break;
      }
    } catch (e) {
      print("e");
    }
  }
  if (opcao == 1) {
    EnvioNormal envio = EnvioNormal(10, codigo, peso);
    envio.gerarEtiqueta(codigo, 10);
  } else {
    EnvioSedex envio = EnvioSedex(10, codigo, peso);
    envio.gerarEtiqueta(codigo, 10);
  }
}
