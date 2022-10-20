import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_detail_watcher/pokemon_detail_watcher_cubit.dart';

class DetailAppBar extends StatelessWidget {

  const DetailAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: const Color(0xff3C4048), boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.25),
          offset: const Offset(0, 4),
          blurRadius: 4,
        )
      ]),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CloseButton(
            color: Colors.white,
            onPressed: () =>
                context.read<PokemonDetailWatcherCubit>().closeDetail(),
          ),
          BlocBuilder<PokemonDetailWatcherCubit, bool>(builder: (_, __) {
            final pokemon = context.read<PokemonDetailWatcherCubit>().pokemon;
            return Row(
              children: [
                Text(
                  pokemon?.name ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  pokemon?.id ?? '',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            );
          }),

          // favorite button
          SizedBox()
        ],
      ),
    );
  }
}
