import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_manager/pokemon_manager_cubit.dart';
import 'package:pokemon/ui/home/component/home_app_bar.dart';
import 'package:pokemon/ui/home/component/pokemon_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3C4048),
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          HomeAppBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    // mainAxisExtent: 20,
                  ),
                  itemBuilder: (_, index) {
                    return PokemonListItem(
                        pokemon: context
                            .read<PokemonManagerCubit>()
                            .pokemonList[index]);
                  }),
            ),
          )
        ],
      ),
    );
  }
}
