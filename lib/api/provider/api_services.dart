import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_bloc/models/articles.dart';
import '../../models/article.dart' as article;
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://192.168.18.25:8090";
  // final Dio _dio = Dio();

  //  Fetch all article published
  // Future<List<article.Article>> getArticles() async {
  //   final response = await http.get("$baseUrl/api/articles/published");
  //   if (response.statusCode == 200) {
  //     return (json.decode(response.body) as List)
  //         .map((data) => article.Article.fromJson(data))
  //         .toList();
  //   } else {
  //     return null;
  //   }
  // }

  Future<Articles> getArticles() async {
    try {
      final response = await http.get("$baseUrl/api/articles/published");
      // final response = await _dio.get("$baseUrl/api/articles/published");
      return Articles.fromJson(json.decode(response.body));
    } catch (error) {
      debugPrint('$error');
      return Articles.withError('$error');
    }
  }
}
