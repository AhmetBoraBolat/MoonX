import 'package:flutter/material.dart';

class ConstText {
  static Text getDescriptionText(BuildContext context) {
    String description = 'Sed ut perspiciatis unde omnis iste natus \n'
        'error sit voluptatem accusam.   Sed ut \n'
        'perspt perspiciatis unde omnis iste natus \n'
        ' error si. \n';

    return Text(description,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey,
            ));
  }

  static Text dashboardBoldTxt(
    String text,
    BuildContext context,
  ) {
    String txt = text;

    return Text(
      txt,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
    );
  }
}
