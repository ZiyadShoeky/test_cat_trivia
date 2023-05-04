import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'fact_history_screen.dart';
import '../bloc/cat_fact_bloc.dart';
import '../bloc/cat_fact_event.dart';
import '../bloc/cat_fact_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CatFactBloc>().add(FetchRandomFactEvent());

    return Scaffold(
      appBar: AppBar(title: const Text('Cat Trivia')),
      body: Center(
        child: BlocBuilder<CatFactBloc, CatFactState>(
          builder: (context, state) {
            if (state is CatFactInitialState || state is CatFactLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CatFactLoadedState) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Center(
                  child: Column(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        height: 200,
                        state.imageUrl,
                        fit: BoxFit.fill,

                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(state.catFact.fact,style: const TextStyle(fontSize: 20),)),
                      ),
                      const SizedBox(height: 10),
                      Text('Created at: ${state.catFact.createdAt}'),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CatFactBloc>().add(FetchRandomFactEvent());
                        },
                        child: const Text('Another fact!'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, FactHistoryScreen.routeName,

                          );

                        },
                        child: const Text('Fact history'),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: Text('Something went wrong!'));
            }
          },
        ),
      ),
    );
  }
}