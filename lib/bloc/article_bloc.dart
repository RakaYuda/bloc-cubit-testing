import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_bloc/api/repository/api_article_repository.dart';
import '../models/articles.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ApiArticleRepository _articleRepository;

  ArticleBloc(this._articleRepository) : super(ArticleInitial());

  @override
  Stream<ArticleState> mapEventToState(
    ArticleEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetArticles) {
      try {
        yield ArticleLoading();
        final articles = await _articleRepository.fetchArticles();
        yield ArticleLoaded(articles);
      } on NetworkException {
        yield ArticleError("Couldn't fetch articles. Is the device online?");
      }
    } 
  }
}
