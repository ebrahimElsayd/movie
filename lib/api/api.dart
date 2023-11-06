import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/model/Results.dart';
import 'package:movieapp/model/constant.dart';
import 'package:movieapp/model/recomenddedResponse/Dates.dart';

class Api {
  static const _popular =
      "https://api.themoviedb.org/3/movie/popular?api_key=${Constant.apiKey}";
  static const _newReleases =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constant.apiKey}";
  static const _recomended =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constant.apiKey}";

  // static const _recomended="https://api.themoviedb.org/3/movie/now_playing?api_key=${Constant.apiKey}";

  static Future<List<Results>> getPopularResponse() async {
    var response = await http.get(Uri.parse(_popular));
    if (response.statusCode == 200) {
      final decodData = json.decode(response.body)['results'] as List;
      print(decodData);
      return decodData.map((result) => Results.fromJson(result)).toList();
    } else {
      throw Exception("somtheing went wrong");
    }
    //var movieResponse = MovieResponse.fromJson(json)
    // return movieResponse;
  }

  static Future<List<Results>> newReleasesResponse() async {
    var response = await http.get(Uri.parse(_newReleases));
    if (response.statusCode == 200) {
      final decodData = json.decode(response.body)['results'] as List;
      print(decodData);
      return decodData.map((result) => Results.fromJson(result)).toList();
    } else {
      throw Exception("somtheing went wrong");
    }
    //var movieResponse = MovieResponse.fromJson(json)
    // return movieResponse;
  }

  static Future<List<Dates>> RecomendedResponse() async {
    var response = await http.get(Uri.parse(_recomended));
    if (response.statusCode == 200) {
      final decodData = json.decode(response.body)['results'] as List;
      print(decodData);
      return decodData.map((result) => Dates.fromJson(result)).toList();
    } else {
      throw Exception("somtheing went wrong");
    }
    //var movieResponse = MovieResponse.fromJson(json)
    // return movieResponse;
  }
}
