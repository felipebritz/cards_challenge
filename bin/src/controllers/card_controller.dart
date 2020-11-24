import 'dart:io';

import '../services/card_services.dart';

class CardController {
  var cardService = CardService();

  void findAllCards() async{
    print('Lista dos cards');
     
    print(await cardService.findAll());
  }

  void findCardById() async{
    print('Recuperar card pelo ID');

    print('Card ID: ');
    var cardId = int.parse(stdin.readLineSync());
    
    print(await cardService.findById(cardId));
  }

  void createCard() async{
    print('Criar Card');
    
    print('Title: ');
    var title = stdin.readLineSync();
    
    print('Content: ');
    var content = stdin.readLineSync();

    print('Criando card...');
    print(await cardService.create(title, content));

  }

  void updateCard() async{
    print('Atualizar card');

    print('Card ID: ');
    var cardId = int.parse(stdin.readLineSync());

    print('Title: ');
    var title = stdin.readLineSync();
    
    print('Content: ');
    var content = stdin.readLineSync();

    if(await cardService.update(cardId, title: title, content: content)){
      print('Atualizado com sucesso');
    } else {
      print('Não foi possível atualizar o card');
    }
  }

  void removeCard() async{
    print('Remover card');

    print('Card ID: ');
    var cardId = int.parse(stdin.readLineSync());

    if(await cardService.delete(cardId)){
      print('Removido com sucesso');
    } else {
      print('Não foi possível remover o card');
    }
  }
}
