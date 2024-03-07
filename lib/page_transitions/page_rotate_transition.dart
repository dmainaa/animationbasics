

import 'package:flutter/cupertino.dart';

class PageRotateTransition extends PageRouteBuilder{
  final dynamic page;

  PageRotateTransition(this.page): super(
      pageBuilder: (context, animation, secondaryAnimation)=>page,
      transitionsBuilder: (context, animation, secondaryAnimation, child){
        var tween = Tween<double>(begin:0.5 , end:  1.0);
        var curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        return RotationTransition(turns: animation, child: child,);

      }
  );
}