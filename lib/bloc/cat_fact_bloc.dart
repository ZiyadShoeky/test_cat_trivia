// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../services/cat_facts_api.dart';
import '../models/cat_fact.dart';
import 'cat_fact_event.dart';
import 'cat_fact_state.dart';

class CatFactBloc extends Bloc<CatFactEvent, CatFactState> {
  final CatFactsApi _catFactsApi;
  final Box<CatFact> _factHistoryBox;

  CatFactBloc(this._catFactsApi, this._factHistoryBox)
      : super(CatFactInitialState());

  @override
  Stream<CatFactState> mapEventToState(CatFactEvent event) async* {
    if (event is FetchRandomFactEvent) {
      yield CatFactLoadingState();

      final catFact = await _catFactsApi.getRandomFact();
      final imageUrl = await _fetchRandomCatImage();

      _factHistoryBox.add(catFact);

      yield CatFactLoadedState(catFact: catFact, imageUrl: imageUrl);
    } else if (event is FetchFactHistoryEvent) {
      final history = _factHistoryBox.values.toList();
      yield CatFactHistoryLoadedState(factHistory: history);
    }
  }

  Future<String> _fetchRandomCatImage() async {
    final response = await http.get(Uri.parse('https://cataas.com/cat?${DateTime.now().millisecondsSinceEpoch}'));

    return response.request!.url.toString();

  }
}