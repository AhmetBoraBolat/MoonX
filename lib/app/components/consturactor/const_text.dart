import 'package:flutter/material.dart';

class ConstText {
  static Text getDescriptionText() {
    String description = 'Sed ut perspiciatis unde omnis iste natus \n'
        'error sit voluptatem accusam.   Sed ut \n'
        'perspt perspiciatis unde omnis iste natus \n'
        ' error si. \n';

    return Text(
      description,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 14,
      ),
    );
  }

  static Text dashboardBoldTxt(String text) {
    String txt = text;
    return Text(
      txt,
      textAlign: TextAlign.left,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }
}
