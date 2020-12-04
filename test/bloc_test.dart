import 'package:bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test_bloc/api/repository/api_article_repository.dart';
import 'package:test_bloc/cubit/article_cubit.dart';
import 'package:test_bloc/models/article.dart';

void main() async {
  final List<Article> articles = await getArticles();
  print(articles);
  mainCubit(articles);
}

void mainCubit(List<Article> articles) async {
  group("Testing Cubit Article", () {
    blocTest("Initial Test",
        build: () => ArticleCubit(ApiArticleRepository()), expect: []);

    blocTest<ArticleCubit, ArticleState>("Cubit Get Article Published",
        build: () => ArticleCubit(ApiArticleRepository()),
        act: (cubit) async => cubit.getArticles(),
        expect: [ArticleLoading()]);

    // blocTest<CounterCubit, int>(
    //   'emits [1] when increment is called',
    //   build: () => CounterCubit(),
    //   act: (cubit) async => cubit.increment(),
    //   expect: const <int>[2],
    // );
  });
}

Future<List<Article>> getArticles() async {
  final ApiArticleRepository _articleRepository = ApiArticleRepository();
  List<Article> articles = await _articleRepository.fetchArticles();
  // print("ok");
  return articles;
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
}
