import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NPShimmer extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const NPShimmer({Key key, this.isLoading = true, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Shimmer.fromColors(
            enabled: true,
            baseColor: const Color(0xffECEAEC),
            highlightColor: const Color(0xffE3E1E3),
            period: const Duration(milliseconds: 1500),
            child: child,
          )
        : child;
  }
}
