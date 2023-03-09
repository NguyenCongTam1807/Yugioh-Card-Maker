import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yugioh_card_maker/const/size_config.dart';
import 'package:yugioh_card_maker/providers/card_provider.dart';
import 'package:provider/provider.dart';

class MonsterLevel extends StatelessWidget {
  const MonsterLevel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context, listen: false);
    final cardWidth = SizeConfig.cardWidth;
    const marginRatio = 0.106;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: cardWidth*marginRatio),
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          var x = details.localPosition.dx;
          cardProvider.setCardLevel(12-x/cardWidth~/0.06566);
        },
        onTapDown: (details) {
          var x = details.localPosition.dx;
          cardProvider.setCardLevel(12-x/cardWidth~/0.06566);
        },
        child: Container(
          color: Colors.red.withOpacity(0.5),
          width: cardWidth*(1-2*marginRatio),
          child: Consumer<CardProvider>(
            builder: (ctx, provider, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(
                    provider.cardInMakerScreen.level??1,
                        (index) => LevelStar(
                      size: cardWidth * 0.065,
                    )),
              );
            },
          ),
        ),
      ),
    );
  }
}

class LevelStar extends StatelessWidget {
  final double size;
  const LevelStar({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:size*0.0102),
      width: size,
      height: size,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/stars/star.png'),
              fit: BoxFit.contain)),
    );
  }
}
