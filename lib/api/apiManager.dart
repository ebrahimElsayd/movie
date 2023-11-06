import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/model/MovieResponse.dart';
import 'package:movieapp/model/constant.dart';

class ApiManager {
  static const baseUrl = "api.themoviedb.org";

//https://api.themoviedb.org/3/movie/popular?api_key=ecdbb235982fe955effef5873b1f162b
  static Future<MovieResponse> getPopularResponse() async {
    var uri =
        Uri.https(baseUrl, "3/movie/popular", {"apiKey": Constant.apiKey});
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var movieResponse = MovieResponse.fromJson(json);
    return movieResponse;
  }
}
