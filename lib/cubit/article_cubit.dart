import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_bloc/api/repository/api_article_repository.dart';
import 'package:test_bloc/models/articles.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final ApiArticleRepository _articleRepository;

  ArticleCubit(this._articleRepository) : super(ArticleInitial());

  Future<void> getArticles() async {
    try {
      emit(ArticleLoading());
      Articles articles = await _articleRepository.fetchArticles();
      emit(ArticleLoaded(articles));
    } on NetworkException {
      emit(ArticleError("Couldn't fetch articles. Is the device online?"));
    }
  }
}
