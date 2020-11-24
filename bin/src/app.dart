import 'dart:io';
import './controllers/card_controller.dart';

class App {
  void execute() async{
    int option;
    var cardController = CardController();

    do {
      print('\nMENU DE OPCOES:\n');
      print('1 - Buscar todos os cards');
      print('2 - Buscar cards pelo ID');
      print('3 - Criar card');
      print('4 - Atualizar card');
      print('5 - Deletar card');
      print('6 - Sair');

      stdout.writeln('Escolha a opção desejada: ');
      option = int.parse(stdin.readLineSync());
      print('');

      switch (option) {
        case 1:
          await cardController.findAllCards();
          break;
        case 2:
          await cardController.findCardById();
          break;
        case 3:
          await cardController.createCard();
          break;
        case 4:
          await cardController.updateCard();
          break;
        case 5:
          await cardController.removeCard();
          break;
        default:
      }
    } while (option != 6);
  }
}
