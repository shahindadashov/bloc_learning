import 'package:bloc_learning/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),

      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  if (state is CounterStateUpdated) {
                    return Text(state.count.toString(), style: TextStyle(fontSize: 42));
                  } else if (state is CounterUpdateInProgress) {
                    return CircularProgressIndicator();
                  }

                  return Text('0', style: TextStyle(fontSize: 42));
                },
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementCount());
                    },
                    child: Text('Increment'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(DecrementCount());
                    },
                    child: Text('Decrement'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
