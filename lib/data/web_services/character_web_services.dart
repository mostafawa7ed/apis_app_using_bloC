import 'package:dio/dio.dart';

import '../../constants/Strings.dart';

class CharacterWebService {
  late Dio dio;
  CharacterWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000, //60 second
      receiveTimeout: 60 * 1000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('/v2/Characters');
      print("get data");
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
