import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/font_config.dart';
import '../../models/yugioh_card.dart';
import '../../providers/card_provider.dart';

class Def extends StatefulWidget {
  final double width;
  final double height;
  const Def({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  State<Def> createState() => _DefState();
}

class _DefState extends State<Def> {
  TextEditingController defController = TextEditingController();

  @override
  void dispose() {
    defController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CardProvider cardProvider = Provider.of<CardProvider>(context);
    YugiohCard currentCard = cardProvider.cardInMakerScreen;
    defController.value = TextEditingValue(text: currentCard.def);
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextField(
        maxLength: 4,
        textAlign: TextAlign.right,
        controller: defController,
        onSubmitted: (String def) {
          cardProvider.setCardDef(def);
        },
        style: kAtkDefStyle,
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          counterText: "",
        ),
      ),
    );
  }
}
