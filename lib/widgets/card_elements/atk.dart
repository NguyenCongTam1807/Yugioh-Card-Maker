import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/font_config.dart';
import '../../models/yugioh_card.dart';
import '../../providers/card_provider.dart';

class Atk extends StatefulWidget {
  final double width;
  final double height;
  const Atk({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  State<Atk> createState() => _AtkState();
}

class _AtkState extends State<Atk> {
  TextEditingController atkController = TextEditingController();

  @override
  void dispose() {
    atkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CardProvider cardProvider = Provider.of<CardProvider>(context);
    YugiohCard currentCard = cardProvider.cardInMakerScreen;
    atkController.value = TextEditingValue(text: currentCard.atk);
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextField(
        maxLength: 4,
        textAlign: TextAlign.right,
        controller: atkController,
        onSubmitted: (String atk) {
          cardProvider.setCardAtk(atk);
        },
        style: kAtkDefStyle,
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(0),
          border: InputBorder.none,
          counterText: "",
        ),
      ),
    );
  }
}
