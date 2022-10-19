import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 5),
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
        children: const [
          Text(
            'Pokémon',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          )
        ],
      ),
    );
  }
}
