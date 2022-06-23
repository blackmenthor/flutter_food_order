import 'package:flutter/material.dart';

enum AyoMaemButtonType {
  BASIC,
}

class AyoMaemButton extends StatelessWidget {
  const AyoMaemButton({
    Key? key,
    this.type = AyoMaemButtonType.BASIC,
  }) : super(key: key);

  final AyoMaemButtonType type;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
