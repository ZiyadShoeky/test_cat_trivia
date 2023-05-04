import 'package:test_cat_trivia/models/cat_fact.dart';
abstract class CatFactState {}

class CatFactInitialState extends CatFactState {}

class CatFactLoadingState extends CatFactState {}

class CatFactLoadedState extends CatFactState {
  final CatFact catFact;
  final String imageUrl;

  CatFactLoadedState({required this.catFact, required this.imageUrl});
}

class CatFactHistoryLoadedState extends CatFactState {
  final List<CatFact> factHistory;

  CatFactHistoryLoadedState({required this.factHistory});
}