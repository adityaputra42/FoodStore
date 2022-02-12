part of 'services.dart';

class FoodServices {
  static Future<ApiReturnValue<List<Food>>> getFoods(
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }
    Uri url = Uri.parse('http://foodmarket-backend.buildwithangga.id/api/food');

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Something Wrong');
    }
    var data = jsonDecode(response.body);

    List<Food> foods = (data['data']['data'] as Iterable)
        .map((e) => Food.fromJson(e))
        .toList();

    return ApiReturnValue(value: foods);
  }
}
