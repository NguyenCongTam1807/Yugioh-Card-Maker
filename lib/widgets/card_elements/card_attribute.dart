import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/yugioh_card.dart';
import '../../providers/card_provider.dart';

class CardAttributeIcon extends StatefulWidget {
  double size;
  CardAttributeIcon({Key? key, required this.size}) : super(key: key);

  @override
  State<CardAttributeIcon> createState() => _CardAttributeIconState();
}

class _CardAttributeIconState extends State<CardAttributeIcon> {
  @override
  Widget build(BuildContext context) {
    CardProvider cardProvider = Provider.of<CardProvider>(context);
    YugiohCard currentCard = cardProvider.cardInMakerScreen;
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
            'assets/images/attribute/${currentCard.attribute.toString().split('.').last}_en.png'),
        fit: BoxFit.contain,
      )),
    );
  }
}
