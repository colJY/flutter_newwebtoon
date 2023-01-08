import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "http://korea-webtoon-api.herokuapp.com/?service=";
  static const String service = "naver";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];

    // async(비동기) 프로그래밍 -> 어떤 일이 일어날 때까지 기다림
    final url = Uri.parse('$baseUrl$service');
    final response = await http
        .get(url); // 기다리게 하고 싶으면 await사용, await를 사용하기 위해서는 async 함수 내에서만 사용 가능

    if (response.statusCode == 200) {
      String jsonData = response.body;

      final List<dynamic> webtoons = jsonDecode(jsonData)['webtoons'];

      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }

      print(webtoonInstances);

      return webtoonInstances;
    }
    throw Error();
  }
}
