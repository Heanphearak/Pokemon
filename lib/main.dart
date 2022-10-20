import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_detail_watcher/pokemon_detail_watcher_cubit.dart';
import 'package:pokemon/bloc/pokemon_manager/pokemon_manager_cubit.dart';
import 'package:pokemon/ui/splash/splash_screen.dart';

void main() {
  // status bar color
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xFFFFCB05), // status bar color
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PokemonManagerCubit()),
        BlocProvider(create: (_) => PokemonDetailWatcherCubit())
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: const Color(0xFFFFCB05)),
        home: const SplashScreen(),
      ),
    );
  }
}
