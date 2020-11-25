import '../services/card_services.dart';

class CardController {
  var cardService = CardService();

  void findAllCards() async {
    try {
      print(await cardService.findAll());
    } catch (error) {
      print(error);
    }
  }

  void findCardById({int cardId}) async {
    try {
      print(await cardService.findById(cardId));
    } catch (error) {
      print(error);
    }
  }

  void createCard({String title, String content}) async {
    try {
      print(await cardService.create(title, content));
    } catch (error) {
      print(error);
    }
  }

  void updateCard(int cardId, {String title, String content}) async {
    try {
      if (await cardService.update(cardId, title: title, content: content)) {
        print('Atualizado com sucesso');
      } else {
        print('Não foi possível atualizar o card');
      }
    } catch (error) {
      print(error);
    }
  }

  void removeCard(int cardId) async {
    if (await cardService.delete(cardId)) {
      print('Removido com sucesso');
    } else {
      print('Não foi possível remover o card');
    }
  }
}
