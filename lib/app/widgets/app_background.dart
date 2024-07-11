import 'package:codeverse/src/gen/colors.gen.dart';
import 'package:flutter/cupertino.dart';

class AppBackground extends StatelessWidget {

  const AppBackground({super.key, required this.childWidget});
final Widget childWidget;
  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        ColorName.cornflowerBlue.withOpacity(0.3),
        ColorName.white,
        ColorName.cornflowerBlue.withOpacity(0.3),

      ],

    ),),child: childWidget,);
  }
}
