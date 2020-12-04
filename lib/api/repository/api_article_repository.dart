import '../../models/articles.dart';
import '../provider/api_services.dart';

class ApiArticleRepository {
  final ApiService _apiArticleProvider = ApiService();

  Future<Articles> fetchArticles() => _apiArticleProvider.getArticles();
}

class NetworkException implements Exception {}
