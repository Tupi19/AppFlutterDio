import 'package:flutter/material.dart';
import 'package:trilhaapp/widgets/app_images.dart';

class ListViewHPage extends StatefulWidget {
  const ListViewHPage({super.key});

  @override
  State<ListViewHPage> createState() => _ListViewHPageState();
}

class _ListViewHPageState extends State<ListViewHPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.User2),
          title: const Text("Usuário"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Olá"),
              Text("08:59"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {},
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                    value: "opcao1", child: Text("opcao1"))
              ];
            },
          ),
        ),
      ],
    );
  }
}
