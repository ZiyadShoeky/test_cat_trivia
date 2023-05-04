import 'package:flutter/material.dart';
import '../../models/cat_fact.dart';

class FactHistoryScreen extends StatelessWidget {
  static const routeName = '/fact_history';
  final List<CatFact> factHistory;

  const FactHistoryScreen({Key? key, required this.factHistory}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Fact History')),
      body: ListView.builder(
        itemCount: factHistory.length,
        itemBuilder: (context, index) {
          final fact = factHistory[index];
          return ListTile(
            title: Text(fact.fact),
            subtitle: Text('Created at: ${fact.createdAt}'),
          );
        },
      ),
    );
  }}