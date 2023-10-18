import 'package:flutter/material.dart';
import 'package:trilhaapp/model/card_detail.dart';
import 'package:trilhaapp/pages/card_detail.dart';
import 'package:trilhaapp/repositories/card_detail_repository.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetail? cardDetail;
  var cardDetailRepository = CardDetailRepository();

  void carregarDados() async {
    cardDetail = await cardDetailRepository.get();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: double.infinity,
        child: cardDetail == null
            ? const LinearProgressIndicator()
            : InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CardDetailPage(
                                cardDetail: cardDetail!,
                              )));
                },
                //
                child: Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              cardDetail!.url,
                              height: 20,
                            ),
                            Text(
                              cardDetail!.title,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          cardDetail!.text,
                          textAlign: TextAlign.justify,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Ler mais"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    ]);
  }
}
