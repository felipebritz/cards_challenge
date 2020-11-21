import '../services/card_services.dart';
import '../entities/card.dart';

class CardController {
  CardService CarService;

  List<Card> findAllCards() {
    print('Lista dos cards');
  }

  Card findCardById({int cardId}) {
    print('Recuperar card pelo ID');
  }

  void createCard() {
    print('Criar Card');
  }

  void updateCard({int cardId}) {
    print('Atualizar card');
  }

  void removeCard({int cardId}) {
    print('Remover card');
  }
}
