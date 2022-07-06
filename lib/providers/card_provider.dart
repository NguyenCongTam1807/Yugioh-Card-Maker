import 'package:flutter/material.dart';
import 'package:yugioh_card_maker/models/yugioh_card.dart';


class CardProvider with ChangeNotifier {
  final YugiohCard _cardInMakerScreen = YugiohCard(level: 6);
  YugiohCard get cardInMakerScreen => _cardInMakerScreen;
  void setCardType(CardType type) {
      _cardInMakerScreen.cardType = type;
      notifyListeners();
  }

  void setCardAttribute(CardAttribute attribute) {
    _cardInMakerScreen.attribute = attribute;
    notifyListeners();
  }

  void setCardMonsterType(String monsterType) {
    _cardInMakerScreen.monsterType = monsterType;
    notifyListeners();
  }

  String toUpperCamelCase(String s) {
    return s[0].toUpperCase()+s.toLowerCase().substring(1);
  }

  void setCardName(String name) {
    _cardInMakerScreen.name = name;
    notifyListeners();
  }

  void setCardTheme(CardType type) {
    _cardInMakerScreen.cardType = type;
    notifyListeners();
  }

  void setCardDescription(String description) {
    _cardInMakerScreen.description = description;
    notifyListeners();
  }

  void setCardAtk(int atk) {
    _cardInMakerScreen.atk = atk;
    notifyListeners();
  }

  void setCardDef(int def) {
    _cardInMakerScreen.def = def;
    notifyListeners();
  }
  //
  // void setCardTheme(CardType type) {
  //   _cardInMakerScreen.cardType = type;
  //   notifyListeners();
  // }
  //
  // void setCardTheme(CardType type) {
  //   _cardInMakerScreen.cardType = type;
  //   notifyListeners();
  // }

  String getCardTypeAssetImage() {
    String cardType = cardInMakerScreen.cardType.toString().split('.').last;
    return 'assets/images/theme/$cardType.png';
  }
}