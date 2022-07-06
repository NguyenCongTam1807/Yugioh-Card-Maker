import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yugioh_card_maker/providers/card_provider.dart';

import '../../const/font_config.dart';
import '../../models/yugioh_card.dart';

//Actually Monster Type and Abilities (if any)
class MonsterType extends StatefulWidget {
  double width;
  double height;
  MonsterType({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  State<MonsterType> createState() => _MonsterTypeState();
}

class _MonsterTypeState extends State<MonsterType> {
  TextEditingController monsterTypeController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    monsterTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CardProvider cardProvider = Provider.of<CardProvider>(context);
    YugiohCard currentCard = cardProvider.cardInMakerScreen;
    monsterTypeController.value = TextEditingValue(
        text: currentCard.monsterType.isEmpty ? '' : '[${currentCard.monsterType}]');
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextField(
        controller: monsterTypeController,
        onSubmitted: (String value) {
          cardProvider.setCardMonsterType(monsterTypeController.text.substring(1,monsterTypeController.text.length-1));
        },
        style: kMonsterTypeStyle,
        decoration: const InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
