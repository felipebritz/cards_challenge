import 'package:dio/dio.dart';
import '../entities/card.dart';

class CardService {
  var dio =
      Dio(BaseOptions(baseUrl: 'https://api-cards-growdev.herokuapp.com'));

  Future<List<Card>> findAll() async {
    var response = await dio.get('/cards');

    return (response.data as List<dynamic>)
        .map((card) => Card.fromJson(card))
        .toList();
  }

  Future<Card> findById(int id) async {
    var response = await dio.get('/cards/$id');

    return Card.fromJson(response.data);
  }

  Future<Card> create(String title, String content) async {
    var response =
        await dio.post('/cards', data: {'title': title, 'content': content});

    return Card.fromJson(response.data);
  }

  Future<bool> update(int id, {String title, String content}) async {
    var response =
        await dio.put('/cards/$id', data: {'title': title, 'content': content});

    if (response.data['id'] == id &&
        response.data['title'] == title &&
        response.data['content'] == content) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> delete(int id) async {
    var response = await dio.delete('/cards/$id');

    try {
      response.data as List<dynamic>;
      return true;
    } catch (e) {
      return false;
    }
  }
}