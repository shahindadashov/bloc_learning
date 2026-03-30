import 'package:bloc_learning/features/auth/presentation/cubit/fikrim_yoxdu_cubit.dart';
import 'package:bloc_learning/features/products/presentation/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FikrimYoxduPage extends StatelessWidget {
  const FikrimYoxduPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FikrimYoxduCubit(),
      child: Scaffold(
        body: BlocConsumer<FikrimYoxduCubit, FikrimYoxduState>(
          listener: (context, state) {
            if (state is BiometricsSuccess) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProductsPage()));
            }
          },
          builder: (context, state) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<FikrimYoxduCubit>().checkBiometrics();
                },
                child: Text("Authenticate"),
              ),
            );
          },
        ),
      ),
    );
  }
}
