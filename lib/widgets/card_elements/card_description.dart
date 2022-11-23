import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/font_config.dart';
import '../../models/yugioh_card.dart';
import '../../providers/card_provider.dart';

class CardDescription extends StatefulWidget {
  double width;
  double height;
  CardDescription({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  State<CardDescription> createState() => _CardDescriptionState();
}

class _CardDescriptionState extends State<CardDescription> {
  TextEditingController cardDescController = TextEditingController();

  @override
  void dispose() {
    cardDescController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CardProvider cardProvider = Provider.of<CardProvider>(context);
    YugiohCard currentCard = cardProvider.cardInMakerScreen;
    cardDescController.value = TextEditingValue(text: currentCard.description);
      return Container(
      padding: EdgeInsets.zero,
      width: widget.width,
      height: widget.height,
      child: TextField(
        controller: cardDescController,
        onSubmitted: (String cardDesc) {
          cardProvider.setCardName(cardDesc);
        },
        style: kCardDescStyle,
        textAlign: TextAlign.justify,
        decoration: const InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
        //maxLines: 6,
        maxLines: 5,
        keyboardType: TextInputType.multiline,
      ),
    );
  }
}
