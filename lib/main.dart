import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:dio/dio.dart';
import 'screens/home_screen.dart';
import 'screens/fact_history_screen.dart';
import 'services/cat_facts_api.dart';
import 'models/cat_fact.dart';
import 'models/cat_fact_hive_adapter.dart';
import 'bloc/cat_fact_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(CatFactAdapter());

  final factHistoryBox = await Hive.openBox<CatFact>('factHistory');
  final catFactsApi = CatFactsApi(Dio(BaseOptions(baseUrl: 'https://cat-fact.herokuapp.com')));

  runApp(MyApp(catFactsApi: catFactsApi, factHistoryBox: factHistoryBox));
}

class MyApp extends StatelessWidget {
  final CatFactsApi catFactsApi;
  final Box<CatFact> factHistoryBox;

  const MyApp({super.key, required this.catFactsApi, required this.factHistoryBox});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Trivia',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => CatFactBloc(catFactsApi, factHistoryBox),
        child: const HomeScreen(),
      ),
      routes: {
        FactHistoryScreen.routeName: (context) => FactHistoryScreen(factHistory: factHistoryBox.values.toList()),
      },
    );
  }
}

