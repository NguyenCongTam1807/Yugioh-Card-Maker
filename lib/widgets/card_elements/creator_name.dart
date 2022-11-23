import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/font_config.dart';
import '../../models/yugioh_card.dart';
import '../../providers/card_provider.dart';

class CreatorName extends StatefulWidget {
  final double width;
  final double height;
  const CreatorName({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  State<CreatorName> createState() => _CreatorNameState();
}

class _CreatorNameState extends State<CreatorName> {
  TextEditingController creatorNameController = TextEditingController();

  @override
  void dispose() {
    creatorNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CardProvider cardProvider = Provider.of<CardProvider>(context);
    YugiohCard currentCard = cardProvider.cardInMakerScreen;
    creatorNameController.value = TextEditingValue(text: currentCard.creatorName);
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextField(
        textAlign: TextAlign.right,
        controller: creatorNameController,
        onSubmitted: (String cardName) {
          cardProvider.setCreatorName(cardName);
        },
        style: kAuthorNameStyle,
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(0),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
