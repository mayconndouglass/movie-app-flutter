import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/title_model.dart';

class TitleProvider with ChangeNotifier {
  final _baseUrl = 'https://moviesdatabase.p.rapidapi.com/titles?year=2023&info=base_info';
  final List<TitleModel> titleList = [];

  Future<void> loadData({int page = 1, String genre = ''}) async {
    String url = '$_baseUrl&page=$page';

    if (genre.isNotEmpty) {
      url = '$url&genre=$genre';
    }

    const headers = {
      'X-RapidAPI-Key': '2c60b4747bmsh8892a80c26977d0p19cd87jsnbffdef5116a0',
      'X-RapidAPI-Host': 'moviesdatabase.p.rapidapi.com'
    };

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      dynamic body = jsonDecode(response.body);

      List<dynamic> results = body['results'];
      results.forEach((result) {
        dynamic transformedString =
          result['genres']['genres'].map((genre) => genre['text'] ?? '').toList().join(', ');
        
        result['genres'] = transformedString;
      });

      titleList.clear();
      titleList.addAll(results.map((data) => TitleModel.fromJson(data)));
      
      notifyListeners();
    } else {
      throw Exception('Ops, Erro no carregamento dos dados');
    }
  }

  Future<List<dynamic>> fetchGenres() async {
    const String url = 'https://moviesdatabase.p.rapidapi.com/titles/utils/genres';
    
    const headers = {
      'X-RapidAPI-Key': '2c60b4747bmsh8892a80c26977d0p19cd87jsnbffdef5116a0',
      'X-RapidAPI-Host': 'moviesdatabase.p.rapidapi.com'
    };

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      dynamic body = jsonDecode(response.body);
      List<dynamic> results = body['results'];
      
      results.removeAt(0);
      
      return results;
    } else {
      throw Exception('Ops, Erro no carregamento dos dados');
    }
  }
}
