import 'package:flutter/material.dart';
import 'package:nine_banner/utils/np_shimmer.dart';

class ShimmerHeroBanner extends StatelessWidget {
  final double statusBarHeight;

  const ShimmerHeroBanner({Key key, this.statusBarHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: statusBarHeight),
          header(),
          const SizedBox(height: 20),
          body(),
        ],
      ),
    );
  }

  Widget body() {
    return Container(
      height: 65,
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: NPShimmer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      4,
                      (index) => Container(
                            height: 8,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color(0xffECEAEC),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                          )),
                ),
              )),
          const SizedBox(width: 24),
          Expanded(
              flex: 1,
              child: NPShimmer(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffECEAEC),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget header() {
    return NPShimmer(
      child: Container(
        height: 44,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xffECEAEC),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );
  }
}
