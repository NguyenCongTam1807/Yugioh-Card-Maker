import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yugioh_card_maker/const/font_config.dart';

import '../../models/yugioh_card.dart';
import '../../providers/card_provider.dart';

class CardName extends StatefulWidget {
  double width;
  double height;
  CardName({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  State<CardName> createState() => _CardNameState();

}

class _CardNameState extends State<CardName> {

  TextEditingController cardNameController = TextEditingController();

  @override
  void dispose() {
    cardNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CardProvider cardProvider = Provider.of<CardProvider>(context);
    YugiohCard currentCard = cardProvider.cardInMakerScreen;
    cardNameController.value = TextEditingValue(text: currentCard.name);
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextField(
        controller: cardNameController,
        onSubmitted: (String cardName) {
          cardProvider.setCardName(cardName);
        },
        style: kCardNameStyle,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
