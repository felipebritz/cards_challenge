import 'package:dio/dio.dart';
import '../entities/card.dart';

class CardService {
  var dio =
      Dio(BaseOptions(baseUrl: 'https://api-cards-growdev.herokuapp.com'));

  Future<List<Card>> findAll() async {
    var response = await dio.get('/cards');
    return response.data.map((card) => Card.fromJson(card)).toList();
  }
}
