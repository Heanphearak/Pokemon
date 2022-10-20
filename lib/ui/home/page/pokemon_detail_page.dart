import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon/bloc/pokemon_detail_watcher/pokemon_detail_watcher_cubit.dart';
import 'package:pokemon/component/type_tag_widget.dart';

import '../component/detail_app_bar.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemon = context.read<PokemonDetailWatcherCubit>().pokemon;
    return Column(
      children: [
        const DetailAppBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.black.withOpacity(.2),
                  child: Image.network(pokemon!.imageUrl, fit: BoxFit.contain),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        children: pokemon.types
                            .map((e) => TypeTagWidget(text: e))
                            .toList(),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        pokemon.description,
                        style: const TextStyle(
                          color: Color(0xffC0C0C0),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        columnWidths: const {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(5),
                        },
                        children: [
                          TableRow(
                            children: [
                              const Align(
                                alignment: Alignment.bottomRight,
                                child: _VisualBarTitle(title: 'speed'),
                              ),
                              _VisualBarValue(value: pokemon.speed),
                            ],
                          ),
                          const TableRow(children: [
                            SizedBox(height: 16),
                            SizedBox(height: 16),
                          ]),
                          TableRow(
                            children: [
                              const Align(
                                alignment: Alignment.bottomRight,
                                child: _VisualBarTitle(title: 'defense'),
                              ),
                              _VisualBarValue(value: pokemon.defense),
                            ],
                          ),
                          const TableRow(children: [
                            SizedBox(height: 16),
                            SizedBox(height: 16),
                          ]),
                          TableRow(
                            children: [
                              const Align(
                                alignment: Alignment.bottomRight,
                                child: _VisualBarTitle(title: 'hp'),
                              ),
                              _VisualBarValue(value: pokemon.hp),
                            ],
                          ),
                          const TableRow(children: [
                            SizedBox(height: 16),
                            SizedBox(height: 16),
                          ]),
                          TableRow(
                            children: [
                              const Align(
                                alignment: Alignment.bottomRight,
                                child: _VisualBarTitle(title: 'attack'),
                              ),
                              _VisualBarValue(value: pokemon.attack),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 26),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _VisualBox(
                            iconAssetPath: 'assets/icon/category.svg',
                            label: pokemon.category,
                          ),
                          _VisualBox(
                            iconAssetPath: 'assets/icon/weight.svg',
                            label: pokemon.weight,
                          ),
                          _VisualBox(
                            iconAssetPath: 'assets/icon/height.svg',
                            label: pokemon.height,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _VisualBarTitle extends StatelessWidget {
  final String title;

  const _VisualBarTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _VisualBarValue extends StatelessWidget {
  final int value;

  const _VisualBarValue({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 13,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * (value / 100),
          height: 13,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              value.toString(),
              style: const TextStyle(
                color: Color(0xff3C4048),
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _VisualBox extends StatelessWidget {
  final String iconAssetPath;
  final String label;

  const _VisualBox({
    Key? key,
    required this.iconAssetPath,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          SvgPicture.asset(iconAssetPath, width: 20, height: 20),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xff3C4048),
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}
