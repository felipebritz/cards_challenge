import 'dart:io';
import './controllers/card_controller.dart';

class App {
  void execute() {
    int option;
    var cardController = CardController();

    do {
      print('MENU DE OPCOES:\n');
      print('1 - Buscar todos os cards');
      print('2 - Buscar cards pelo ID');
      print('3 - Criar card');
      print('4 - Atualizar card');
      print('5 - Deletar card');
      print('6 - Sair');

      stdout.writeln('Escolha a opção desejada: ');
      option = int.parse(stdin.readLineSync());

      switch (option) {
        case 1:
          cardController.findAllCards();
          break;
        case 2:
          cardController.findCardById(cardId: 1);
          break;
        case 3:
          cardController.createCard();
          break;
        case 4:
          cardController.updateCard(cardId: 2);
          break;
        case 5:
          cardController.removeCard(cardId: 3);
          break;
        default:
      }
    } while (option != 6);
  }
}
