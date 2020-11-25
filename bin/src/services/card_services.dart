import 'package:dio/dio.dart';
import '../entities/card.dart';

class CardService {
  var dio =
      Dio(BaseOptions(baseUrl: 'https://api-cards-growdev.herokuapp.com'));

  Future<List<Card>> findAll() async {
    try {
      var response = await dio.get('/cards');

      return (response.data as List<dynamic>)
          .map((card) => Card.fromJson(card))
          .toList();
    } catch (error) {
      throw 'Erro';
    }
  }

  Future<Card> findById(int id) async {
    try {
      var response = await dio.get('/cards/$id');
      return Card.fromJson(response.data);
    } catch (error) {
      throw 'Erro';
    }
  }

  Future<Card> create(String title, String content) async {
    try {
      var response =
          await dio.post('/cards', data: {'title': title, 'content': content});

      return Card.fromJson(response.data);
    } catch (error) {
      throw 'Erro';
    }
  }

  Future<bool> update(int id, {String title, String content}) async {
    try {
      var response = await dio
          .put('/cards/$id', data: {'title': title, 'content': content});

      if (response.data['id'] == id &&
          response.data['title'] == title &&
          response.data['content'] == content) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      throw 'Erro';
    }
  }

  Future<bool> delete(int id) async {
    try {
      var response = await dio.delete('/cards/$id');
      response.data as List<dynamic>;
      return true;
    } catch (e) {
      return false;
    }
  }
}
