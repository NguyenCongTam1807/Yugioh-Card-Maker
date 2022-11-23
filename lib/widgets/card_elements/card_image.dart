import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:yugioh_card_maker/models/yugioh_card.dart';

import '../../providers/card_provider.dart';

class CardImage extends StatefulWidget {
  final double size;
  final ValueNotifier<Matrix4>? notifier;
  CardImage({Key? key, required this.size, this.notifier}) : super(key: key);

  @override
  State<CardImage> createState() => _CardImageState();
}

ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
ValueNotifier<Matrix4> notifier1 = ValueNotifier(Matrix4.identity());
ValueNotifier<Matrix4> notifier2 = ValueNotifier(Matrix4.identity());
ValueNotifier<Matrix4> notifier3 = ValueNotifier(Matrix4.identity());

class _CardImageState extends State<CardImage> {
  @override
  Widget build(BuildContext context) {
    CardProvider cardProvider = Provider.of<CardProvider>(context);
    YugiohCard currentCard = cardProvider.cardInMakerScreen;
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(currentCard.imagePath), )
      ),
    );
  }
}
