// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Articles _$ArticlesFromJson(Map<String, dynamic> json) {
  return Articles(
    (json['articles'] as List)
        ?.map((e) =>
            e == null ? null : Article.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ArticlesToJson(Articles instance) => <String, dynamic>{
      'articles': instance.listArticle,
    };

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    id: json['id'] as int,
    imgArticle: json['img_article'] as String,
    titleArticle: json['title_article'] as String,
    article: json['article'] as String,
    postDate: json['post_date'] as String,
    published: json['published'] as bool,
    idAuthor: json['id_author'] as int,
    author: json['author'] == null
        ? null
        : Author.fromJson(json['author'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'img_article': instance.imgArticle,
      'title_article': instance.titleArticle,
      'article': instance.article,
      'post_date': instance.postDate,
      'published': instance.published,
      'id_author': instance.idAuthor,
      'author': instance.author,
    };

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return Author(
    id: json['id'] as int,
    nameAuthor: json['name_author'] as String,
    imgAuthor: json['img_author'] as String,
  );
}

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'id': instance.id,
      'name_author': instance.nameAuthor,
      'img_author': instance.imgAuthor,
    };
