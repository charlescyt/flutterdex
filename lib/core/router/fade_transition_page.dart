import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class FadeTransitionPage<T> extends CustomTransitionPage<T> {
  FadeTransitionPage({
    required LocalKey pageKey,
    super.transitionDuration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    required super.child,
  }) : super(
          key: pageKey,
          reverseTransitionDuration: transitionDuration,
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(CurvedAnimation(parent: animation, curve: curve)),
            child: child,
          ),
        );
}
