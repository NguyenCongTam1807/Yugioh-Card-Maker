import 'dart:ffi';

import 'package:flutter/material.dart';

enum CardAttribute { dark, light, earth, wind, fire, water, divine, spell, trap }

enum CardType {
  normal,
  effect,
  fusion,
  ritual,
  synchro,
  token,
  xyz,
  spell,
  trap,
  link
}

enum Property {
  continuous,
  counter,
  equip,
  field,
  quickPlay,
  ritual,
  none,
}

class YugiohCard {
  late String name;
  late CardAttribute attribute;
  late String imagePath;
  late String monsterType;
  late String description;
  late int atk;
  late int def;
  late String creatorName;
  late CardType cardType;
  int? level;
  Property? property;

  YugiohCard({
    this.name = 'Card Name',
    this.attribute = CardAttribute.light,
    this.imagePath = 'assets/images/loading1.jpg',
    this.monsterType = 'Dragon',
    this.description = 'Card description',
    this.atk = 3000,
    this.def = 2500,
    this.creatorName = 'YOUR NAME',
    this.cardType = CardType.normal,
    this.level,
    this.property,
  });
}
