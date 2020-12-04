part of 'article_bloc.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();
  
  @override
  List<Object> get props => [];
}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final Articles articles;

  ArticleLoaded(this.articles);

  @override
  List<Object> get props => [articles];
}

class ArticleError extends ArticleState {
  final String errorMessage;

  ArticleError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'ArticleError{errorMessage: $errorMessage}';
  }
}
