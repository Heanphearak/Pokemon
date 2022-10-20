import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_detail_watcher/pokemon_detail_watcher_cubit.dart';
import 'package:pokemon/ui/home/page/pokemon_detail_page.dart';
import 'package:pokemon/ui/home/page/pokemon_grid_page.dart';
import 'package:animations/animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final transitionType = SharedAxisTransitionType.scaled;
  final gridScrollCtrl = ScrollController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: BlocBuilder<PokemonDetailWatcherCubit, bool>(
        builder: (_, isOpen) => PageTransitionSwitcher(
          reverse: !isOpen,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              animation: animation,
              fillColor: const Color(0xff3C4048),
              secondaryAnimation: secondaryAnimation,
              transitionType: transitionType,
              child: child,
            );
          },
          child: isOpen ? const PokemonDetailPage() : const PokemonGridPage(),
        ),
      ),
    );
  }
}
