
import 'dart:io';


abstract class Pagamento {
  double valorOriginal = 10;
  Pagamento([this.valorOriginal = 10]);

  double processar() {
    return valorOriginal;
  }
}

class Cartao extends Pagamento {
  Cartao([double valorOriginal = 10]) : super(valorOriginal);

  @override
  double processar() {
    return valorOriginal * 1.2;
  }

}

class Pix extends Pagamento {
  Pix([double valorOriginal = 10]) : super(valorOriginal);

  @override
  double processar() {
    return valorOriginal * 0.9;
  }

}

void main(List<String> arguments) {
  stdout.write("Digite seu saldo na conta");
  double? saldo = double.parse(stdin.readLineSync()!);
  int? opcao;
  while (true){
      stdout.write("Digite 1 para pagar em cartao e 2 para pagar no pix");
      double? opcao = double.parse(stdin.readLineSync()!);
    try{
      if (opcao == 1 || opcao == 2){
        break;
      }
      else{
        print("opcao invalida");
      }
    }
    catch(e){
      print("e");
    }
  }
  if (opcao == 1) {
    Cartao pagamento = Cartao();
    double valor_Final = pagamento.processar();
    if (saldo - valor_Final >= 0) {
      saldo -= - valor_Final;
      print("Pagamento de R\$ $valor_Final Aprovado! Saldo restante: R\$ $saldo");
    }
    else{
      valor_Final -= saldo;
      print("Pagamento Negado! Saldo insuficiente. Faltam R\$ $valor_Final");
    }
  }
  else if (opcao == 2) {
    Pix pagamento = Pix();
    double valor_Final = pagamento.processar();
    if (saldo - valor_Final >= 0) {
      saldo -= valor_Final;
      print("Pagamento de R\$ $valor_Final Aprovado! Saldo restante: R\$ $saldo");
    }
    else{
      valor_Final -= saldo;
      print("Pagamento Negado! Saldo insuficiente. Faltam R\$ $valor_Final");
    }
  }
  else{
    print("opcao invalida, processo encerrado");
  }
}
