import 'package:flutter/material.dart';

class ListViewCarrosel extends StatefulWidget {
  const ListViewCarrosel({super.key});

  @override
  State<ListViewCarrosel> createState() => _ListViewCarroselState();
}

class _ListViewCarroselState extends State<ListViewCarrosel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 1,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Image.asset(
                  "lib/images/360_F_511253627_zuzpapnIVQueMx4eSL1ilAoH61OBgj0C.jpg"),
              Image.asset(
                  "lib/images/360_F_511253627_zuzpapnIVQueMx4eSL1ilAoH61OBgj0C.jpg")
            ],
          ),
        ),
        Expanded(flex: 1, child: Container())
      ],
    ));
  }
}
