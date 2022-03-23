import 'dart:async';
import 'dart:convert';
import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:nine_banner/model/banner_model.dart';
import 'package:flutter_swiper_plus/src/transformer_page_view/transformer_page_view.dart';
import 'package:nine_banner/model/model_reminder_home.dart';
import 'package:nine_banner/utils/cache_image_custom.dart';
import 'package:nine_banner/utils/np_default_button.dart';
import 'package:http/http.dart' as http;

enum BannerSize{
  thin, medium,header
}

class BannerView extends StatefulWidget {
  final String inventory;
  final double height;
  final Function(Reminders reminders) onPressed;
  final BannerSize bannerSize;

  BannerView({this.inventory, this.height, this.onPressed, this.bannerSize});

  @override
  _BannerViewState createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
  BannerModel bannerModel;
  Future<BannerModel> futureBanner;

  @override
  void initState() {
    super.initState();
    futureBanner = fetchBanner();
  }

  Future<BannerModel> fetchBanner() async {
    final response = await http.get(Uri.parse('https://nhanhoang.work/app_home_top.json'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return BannerModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load banner');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureBanner,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          bannerModel = snapshot.data;

          //test multipe banner
          BannerItem bannerItem = bannerModel.banners[0];

          bannerModel.banners.add(bannerItem);
          bannerModel.banners.add(bannerItem);

          print('banner MOdel ==   ${snapshot.data}');
          //xử lý view tại đây image ? json ? video
          return Container(
              color: Colors.white,
              child: bannerModel == null
                  ? Container()
                  : Column(
                      children: [
                        SizedBox(
                          height: (MediaQuery.of(context).size.width - 16) * 104 / 328,
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: NPDefaultButton(
                                  onPressed: () {
                                    Reminders reminders = Reminders.convert(bannerModel.banners[index].target);
                                    widget.onPressed(reminders);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CacheImageCustom(
                                      imageUrl: bannerModel.banners[index].image,
                                      fit: BoxFit.fitWidth,
                                      height: (MediaQuery.of(context).size.width - 16) * 104 / 328,
                                    ),
                                  ),
                                ),
                              );
                            },
                            indicatorLayout: PageIndicatorLayout.SCALE,
                            autoplay: bannerModel.banners.length > 1,
                            viewportFraction: 1,
                            autoplayDelay: 5000,
                            autoplayDisableOnInteraction: true,
                            itemCount: bannerModel.banners.length,
                            pagination: bannerModel.banners.length > 1
                                ? const SwiperPagination(margin: EdgeInsets.only(bottom: 10))
                                : null,
                            layout: SwiperLayout.DEFAULT,
                            loop: bannerModel.banners.length > 1,
                            transformer: CustomZoomOutPageTransformer(),
                          ),
                        ),
                      ],
                    ));
        }
        return Container();
      },
    );
  }
}

class CustomZoomOutPageTransformer extends PageTransformer {
  static const double MIN_SCALE = 0.9;

  @override
  Widget transform(Widget child, TransformInfo info) {
    double position = info.position;
    double pageWidth = info.width;
    double pageHeight = info.height;
    double scaleFactor = Math.max(MIN_SCALE, 1 - position.abs());
    double vertMargin = pageHeight * (1 - scaleFactor) / 2;
    double horzMargin = pageWidth * (1 - scaleFactor) / 2;
    double dx;
    if (position < 0) {
      dx = (horzMargin - vertMargin / 2);
    } else {
      dx = (-horzMargin + vertMargin / 2);
    }
    if (position < 0) {
      return Transform.translate(
        offset: Offset(dx, 0.0),
        child: Transform.scale(
          scale: scaleFactor,
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(
                3,
                2,
                0.002,
              )
              ..rotateY(position),
            alignment: AlignmentDirectional.centerEnd,
            child: child,
          ),
        ),
      );
    } else {
      return Transform.translate(
        offset: Offset(dx, 0.0),
        child: Transform.scale(
          scale: scaleFactor,
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(
                3,
                2,
                0.001,
              )
              ..rotateY(position),
            alignment: AlignmentDirectional.centerStart,
            child: child,
          ),
        ),
      );
    }
  }
}
