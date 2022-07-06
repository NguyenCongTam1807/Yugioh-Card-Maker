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
    cardDescController.value = const TextEditingValue(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam in scelerisque sem. Maurisvolutpat, dolor id interdum ullamcorper, risus dolor egestas lectus, sit amet mattis purusdui nec risus. Maecenas non sodales nisi, vel dictum dolor. Class aptent taciti sociosqu adlitora torquent per conubia nostra, per inceptos himenaeos. Suspendisse blandit eleifenddiam, vel rutrum tellus vulputate quis. Aliquam eget libero aliquet, imperdiet nisl a,ornare ex. Sed rhoncus est ut libero porta lobortis. Fusce in dictum tellus.");
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
