import 'package:bloc_learning/features/map/presentation/map_page.dart';
import 'package:bloc_learning/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: Scaffold(
        body: BlocConsumer<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is SplashLoaded) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MapPage()));
            } else if (state is SplashLoading) {
              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Loading...")));
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text(state is SplashLoading ? "Initializing..." : "Splash Page")),
                SizedBox(height: 20),
                if (state is SplashLoading) Center(child: CircularProgressIndicator()),
              ],
            );
          },
        ),
      ),
    );
  }
}
