import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/pokemon_manager/pokemon_manager_cubit.dart';
import '../component/home_app_bar.dart';
import '../component/pokemon_grid_item.dart';

class PokemonGridPage extends StatefulWidget {
  const PokemonGridPage({Key? key}) : super(key: key);

  @override
  State<PokemonGridPage> createState() => _PokemonGridPageState();
}

class _PokemonGridPageState extends State<PokemonGridPage>
    with AutomaticKeepAliveClientMixin<PokemonGridPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        const HomeAppBar(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: GridView.builder(
                key: const PageStorageKey<String>('pokemonGrid'),
                physics: const BouncingScrollPhysics(),
                itemCount:
                    context.read<PokemonManagerCubit>().pokemonList.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 3,
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 13,
                ),
                itemBuilder: (_, index) {
                  return PokemonGridItem(
                      pokemon: context
                          .read<PokemonManagerCubit>()
                          .pokemonList[index]);
                }),
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
