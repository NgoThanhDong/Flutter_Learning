import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc.dart';
import 'bloc/counter_state.dart';
import 'bloc/counter_event.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Bloc for kids')),
          body: Center(
            child: state.isLoading
                ? const CircularProgressIndicator()
                : Text(
                    'Count: ${state.count}',
                    style: const TextStyle(fontSize: 32),
                  ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementPressed());
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
