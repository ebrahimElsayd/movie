import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/model/Recomended2/rec.dart';
import 'package:movieapp/model/Results.dart';
import 'package:movieapp/model/constant.dart';
import 'package:movieapp/model/detail/Details.dart';
import 'package:movieapp/model/recomenRes/recomend.dart';

class Api {
  static const popular =
      "https://api.themoviedb.org/3/movie/popular?api_key=${Constant.apiKey}";
  static const newReleases =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constant.apiKey}";
  static const recomended =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constant.apiKey}";

  // static const likeThis="https://api.themoviedb.org/3/movie/$movieId/similar?api_key=${Constant.apiKey}";



  static Future<List<Details>> getPopularResponse() async {
    var response = await http.get(Uri.parse(popular));
    if (response.statusCode == 200) {
      final decodData = json.decode(response.body)['results'] as List;
      print(decodData);
      return decodData.map((result) => Details.fromJson(result)).toList();
    } else {
      throw Exception("somtheing went wrong");
    }

  }



  static Future<List<Details>> newReleasesResponse() async {
    var response = await http.get(Uri.parse(newReleases));
    if (response.statusCode == 200) {
      final decodData = json.decode(response.body)['results'] as List;
      print(decodData);
      return decodData.map((result) => Details.fromJson(result)).toList();
      // return decodData.map((result) => Rec.fromJson(result)).toList();
    } else {
      throw Exception("somtheing went wrong");
    }
    //var movieResponse = MovieResponse.fromJson(json)
    // return movieResponse;
  }


  static Future<List<Details>> RecomendedResponse() async {
    var response = await http.get(Uri.parse(recomended));
    if (response.statusCode == 200) {
      final decodData = json.decode(response.body)['results'] as List;
      print(decodData);
      // return decodData.map((result) => Results.fromJson(result)).toList();
      return decodData.map((result) => Details.fromJson(result)).toList();
    } else {
      throw Exception("somtheing went wrong");
    }
    //var movieResponse = MovieResponse.fromJson(json)
    // return movieResponse;
  }


  static Future<List<Details>> MoreLike(int id) async {

    final likeThis="https://api.themoviedb.org/3/movie/$id/similar?api_key=${Constant.apiKey}";
    var response = await http.get(Uri.parse(likeThis));
    if (response.statusCode == 200) {
      final decodData = json.decode(response.body)['results'] as List;
      print(decodData);
      // return decodData.map((result) => Results.fromJson(result)).toList();
      return decodData.map((result) => Details.fromJson(result)).toList();
    } else {
      throw Exception("somtheing went wrong");
    }
    //var movieResponse = MovieResponse.fromJson(json)
    // return movieResponse;
  }




}
