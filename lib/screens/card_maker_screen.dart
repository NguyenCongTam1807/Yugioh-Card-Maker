import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yugioh_card_maker/models/yugioh_card.dart';
import 'package:yugioh_card_maker/providers/card_provider.dart';
import 'package:yugioh_card_maker/widgets/spell_card.dart';

import '../const/size_config.dart';
import '../widgets/card_elements/card_image.dart';
import '../widgets/monster_card/monster_card.dart';
import '../widgets/trap_card.dart';

class CardMakerScreen extends StatefulWidget {
  const CardMakerScreen({Key? key}) : super(key: key);

  @override
  State<CardMakerScreen> createState() => _CardMakerScreenState();
}

class _CardMakerScreenState extends State<CardMakerScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().setSize(context);
    CardProvider cardProvider = Provider.of<CardProvider>(context, listen: false);
    YugiohCard currentCard = cardProvider.cardInMakerScreen;
    double cardWidth = SizeConfig.cardWidth;
    double cardHeight = SizeConfig.cardHeight;
    return Center(
        child: SingleChildScrollView(
          child: SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Stack(children: [
          //Card Class By Card Type
          currentCard.cardType== CardType.spell?
              const SpellCard():
          currentCard.cardType== CardType.trap?
              const TrapCard():
          MonsterCard(
            width: cardWidth,
            height: cardHeight,
          ),
      ]),
    ),
        ));
  }
}

class MakerScreenButton extends StatelessWidget {
  double buttonWidth;
  double buttonHeight;
  double? left;
  double? top;
  double? right;
  double? bottom;
  String iconAsset;
  Function() onTap;
  MakerScreenButton(
      {Key? key,
      required this.buttonWidth,
      required this.buttonHeight,
      this.top,
      this.left,
      required this.iconAsset,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: left ?? 0,
        top: top ?? 0,
        child: Container(
          width: buttonWidth,
          height: buttonHeight,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(iconAsset),
            fit: BoxFit.cover,
          )),
        ));
  }
}
