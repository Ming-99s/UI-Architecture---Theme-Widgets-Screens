import 'package:flutter/material.dart';

class RouteHelper {
  static Route<T> createBottomToTopRoute<T>(Widget screen) {
    const begin = Offset(0.0, 2.0);
    const end = Offset(0.0, 0.0);

    return _createAnimatedRoute(screen, begin, end);
  }

  static Route<T> _createAnimatedRoute<T>(
    Widget screen,
    Offset begin,
    Offset end,
  ) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,

      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOut;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
