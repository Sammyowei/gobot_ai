import 'package:flutter/material.dart';

class CustomPageRouteWithTransitionAnimation extends PageRouteBuilder {
  final Widget enterWidget;
  final int? transitionDurationinMIliSeconds;
  final int? reverseTransitionDurationInMiliSec;
  final Curve? curves;
  final Curve? reverseCurve;

  CustomPageRouteWithTransitionAnimation({
    this.reverseCurve,
    this.transitionDurationinMIliSeconds,
    this.reverseTransitionDurationInMiliSec,
    this.curves,
    required this.enterWidget,
  }) : super(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) => enterWidget,
          transitionDuration:
              Duration(milliseconds: transitionDurationinMIliSeconds ?? 1500),
          reverseTransitionDuration: Duration(
              milliseconds: reverseTransitionDurationInMiliSec ?? 1000),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation = CurvedAnimation(
              parent: animation,
              curve: curves ?? Curves.linear,
              reverseCurve: reverseCurve ?? Curves.fastOutSlowIn,
            );
            return ScaleTransition(
              scale: animation,
              alignment: const Alignment(1, 1),
              child: child,
            );
          },
        );
}
