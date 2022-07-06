import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yugioh_card_maker/models/yugioh_card.dart';
import 'package:yugioh_card_maker/providers/card_provider.dart';
import 'package:yugioh_card_maker/widgets/card_elements/card_attribute.dart';
import 'package:yugioh_card_maker/widgets/card_elements/card_description.dart';

import '../card_elements/card_image.dart';
import '../card_elements/card_name.dart';
import '../card_elements/monster_level.dart';
import '../card_elements/monster_type.dart';

class MonsterCard extends StatefulWidget {
  double width;
  double height;
  MonsterCard({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  State<MonsterCard> createState() => _MonsterCardState();
}

class _MonsterCardState extends State<MonsterCard> {
  @override
  Widget build(BuildContext context) {
    CardProvider cardProvider = Provider.of<CardProvider>(context);
    YugiohCard yugiohCard = cardProvider.cardInMakerScreen;
    return Stack(children: [
      //Card Image
      Positioned(
        top: 0.2685 * widget.width,
        left: 0.121 * widget.width,
        child: CardImage(size: widget.width * 0.759),
      ),
      //Card Frame Theme By Type
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(cardProvider.getCardTypeAssetImage()),
                fit: BoxFit.cover)),
      ),
      //Card Name
      Positioned(
        top: 0.07 * widget.width,
        left: 0.074 * widget.width,
        child:
            CardName(width: widget.width * 0.755, height: widget.width * 0.108),
      ),
      //Card Attribute
      Positioned(
        top: 0.069 * widget.width,
        left: 0.835 * widget.width,
        child: CardAttributeIcon(
          size: widget.width * 0.095,
        ),
      ),
      //Monster Level
      Positioned(
        top: 0.181 * widget.width,
        child: MonsterLevel(
          count: yugiohCard.level!,
        ),
      ),
      Positioned(
          top: widget.width * 1.09,
          left: widget.width * 0.078,
          child: MonsterType(
              width: widget.width * 0.844, height: widget.width * 0.06)),
      Positioned(
          top: widget.width * 1.13,
          left: widget.width * 0.078,
          child: CardDescription(
              width: widget.width * 0.844, height: widget.width * 0.2)),
    ]);
  }
}
