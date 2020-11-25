import 'dart:io';
import './controllers/card_controller.dart';

class App {
  void execute() async {
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
          print('Recuperar card pelo ID');
          print('Card ID: ');
          var cardId = int.parse(stdin.readLineSync());

          await cardController.findCardById(cardId: cardId);
          break;
        case 3:
          print('Criar Card');
          print('Title: ');
          var title = stdin.readLineSync();
          print('Content: ');
          var content = stdin.readLineSync();
          print('Criando card...');

          await cardController.createCard(title: title, content: content);
          break;
        case 4:
          print('Atualizar card');
          print('Card ID: ');
          var cardId = int.parse(stdin.readLineSync());
          print('Title: ');
          var title = stdin.readLineSync();
          print('Content: ');
          var content = stdin.readLineSync();

          await cardController.updateCard(
            cardId,
            title: title,
            content: content,
          );
          break;
        case 5:
          print('Remover card');
          print('Card ID: ');
          var cardId = int.parse(stdin.readLineSync());

          await cardController.removeCard(cardId);
          break;
        default:
      }
    } while (option != 6);
  }
}
