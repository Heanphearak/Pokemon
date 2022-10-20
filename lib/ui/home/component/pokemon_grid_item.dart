import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_detail_watcher/pokemon_detail_watcher_cubit.dart';
import 'package:pokemon/component/type_tag_widget.dart';

import '../../../model/pokemon.dart';

class PokemonGridItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonGridItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.read<PokemonDetailWatcherCubit>().openDetail(pokemon),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.2),
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 2,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Stack(
            children: [
              Positioned.fill(child: Image.network(pokemon.imageUrl)),
              Positioned(
                bottom: 0,
                child: _InfoBox(pokemon: pokemon),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final Pokemon pokemon;

  const _InfoBox({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.47),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(13),
              bottomRight: Radius.circular(13),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    pokemon.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                    ),
                  ),
                  const Text(
                    ' - ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    pokemon.id,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Row(
                children:
                    pokemon.types.map((e) => TypeTagWidget(text: e)).toList(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
