import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemon/bloc/pokemon_manager/pokemon_manager_cubit.dart';
import 'package:pokemon/ui/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    await context.read<PokemonManagerCubit>().initData();
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3C4048),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pokémon',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 50,
                fontWeight: FontWeight.w900,
              ),
            ),
            LoadingAnimationWidget.waveDots(
              color: Theme.of(context).primaryColor,
              size: 50,
            )
          ],
        ),
      ),
    );
  }
}
