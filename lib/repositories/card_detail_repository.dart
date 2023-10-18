import 'package:trilhaapp/model/card_detail.dart';

class CardDetailRepository {
  Future<CardDetail> get() async {
    await Future.delayed(const Duration(seconds: 0));
    return (CardDetail(
      1,
      "meu Texto",
      "https://hermes.digitalinnovation.one/assets/diome/logo.png",
      "Domine as tecnologias utilizadas pelas empresas mais inovadoras do mundo e encare seu novo desafio profissional, evoluindo em comunidade com os melhores experts.",
    ));
  }
}
