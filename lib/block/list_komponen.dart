import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/api/api_article.dart';
import 'package:new_project/model/article.dart';

class ArticleEvent {}

abstract class ArticleState {}

class ArticleUnitialized extends ArticleState {}

class ArticleLoaded extends ArticleState {
  List<Article> artikel = [];
  bool isLoading;

  ArticleLoaded({required this.artikel, required this.isLoading});

  ArticleLoaded copyWith({List<Article>? artikel, bool? isLoading}) {
    return ArticleLoaded(
        artikel: artikel ?? this.artikel,
        isLoading: isLoading ?? this.isLoading);
  }
}

class ListKomponen extends Bloc<ArticleEvent, ArticleState> {
  ListKomponen() : super(ArticleUnitialized());

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    List<Article> artikel = [];

    if (state is ArticleUnitialized) {
      artikel = await ApiArticles.futureGetApiArticles()
          .then((value) => value.articles!);
      yield ArticleLoaded(artikel: artikel, isLoading: false);
    } else {
      ArticleLoaded artikelLoaded = state as ArticleLoaded;
      artikel =
          await ApiArticles.futureGetApiArticles().then((value) => artikel);
      yield (artikel.isEmpty)
          ? artikelLoaded.copyWith(isLoading: false)
          : ArticleLoaded(artikel: artikelLoaded.artikel, isLoading: false);
    }
  }
}
