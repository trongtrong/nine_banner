import 'package:flutter/material.dart';
import 'package:nine_banner/model/banner_model.dart';

class BannerView extends StatefulWidget {
  final BannerModel bannerModel;

  BannerView({this.bannerModel});

  @override
  _BannerViewState createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
  @override
  void initState() {



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.bannerModel.banners[0].image.endsWith('.image') ? buildHeaderBanner() : buildHeaderBanner();
  }

  Widget buildHeaderBanner() => Container();

  Widget buildMediumBanner() => Container();

  Widget buildThinBanner() => Container();
}
