import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yugioh_card_maker/const/size_config.dart';

class MonsterLevel extends StatefulWidget {
  int count;
  MonsterLevel({Key? key, required this.count}) : super(key: key);

  @override
  State<MonsterLevel> createState() => _MonsterLevelState();
}

class _MonsterLevelState extends State<MonsterLevel> {
  @override
  Widget build(BuildContext context) {
    double cardWidth = SizeConfig.cardWidth;
    List<LevelStar> stars = List.generate(
        widget.count,
        (index) => LevelStar(
              size: cardWidth * 0.065,
            ));
    return Row(
      children: [
        SizedBox(
          width: cardWidth,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: cardWidth*0.106),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: stars,
            ),
          ),
        ),
      ],
    );
  }
}

class LevelStar extends StatelessWidget {
  double size;
  LevelStar({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:size*0.0102),
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/stars/star.png'),
                fit: BoxFit.contain)),
      ),
    );
  }
}
