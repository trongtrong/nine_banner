import 'package:flutter/material.dart';
import 'package:nine_banner/utils/custom_pageview/worm_effect.dart';

import 'indicator_effect.dart';

class SmoothPageIndicatorCarousel extends AnimatedWidget {
  // a PageView controller to listen for page offset updates
  final ValueNotifier<int> controller;

  /// Holds effect configuration to be used in the [IndicatorPainter]
  final IndicatorEffect effect;

  /// The number of children in [PageView]
  final int count;

  /// If [textDirection] is [TextDirection.rtl], page offset will be reversed
  final TextDirection textDirection;

  SmoothPageIndicatorCarousel({
    @required this.controller,
    @required this.count,
    this.textDirection,
    this.effect = const WormEffect(),
    Key key,
  })  : assert(controller != null),
        assert(effect != null),
        assert(count != null),
        super(listenable: controller, key: key);

  @override
  Widget build(BuildContext context) {
    // if textDirection is not provided use the nearest directionality up the widgets tree;
    final isRTL =
        (textDirection ?? Directionality.of(context)) == TextDirection.rtl;
    return CustomPaint(
      // different effects have different sizes
      // so we calculate size based on the provided effect
      size: effect.calculateSize(count),
      // rebuild the painter with the new offset every time it updates
      painter: effect.buildPainter(
        count,
        _currentPage,
        isRTL,
      ),
    );
  }

  double get _currentPage {
    try {
      return controller.value.toDouble();
    } catch (Exception) {
      return controller.value.toDouble();
    }
  }
}
