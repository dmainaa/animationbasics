import 'package:flutter/material.dart';


class PageScaleTransition extends PageRouteBuilder{

  dynamic page;
  PageScaleTransition(this.page): super(
      pageBuilder: (context, animation, secondaryAnimation)=>page,
      transitionsBuilder: (context, animation, secondaryAnimation, child){
        var tween = Tween<double>(begin:0.5 , end:  1.0);
        var curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        return ScaleTransition(scale: tween.animate(curvedAnimation), child: child,);
      },
    transitionDuration: const Duration(milliseconds: 500)
  );

}
