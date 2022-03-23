import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CacheImageCustom extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double width;
  final double height;
  final Color color;
  final ImageWidgetBuilder imageBuilder;
  final BlendMode colorBlendMode;
  final Widget Function(BuildContext context, String url, dynamic error)
      errorWidget;
  final Widget Function(BuildContext context, String url) placeholder;

  const CacheImageCustom(
      {Key key,
      @required this.imageUrl,
      this.fit = BoxFit.contain,
      this.width,
      this.height,
      this.color,
      this.errorWidget,
      this.placeholder,
      this.colorBlendMode,
      this.imageBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
            imageUrl: imageUrl,
            fit: fit,
            width: width,
            height: height,
            color: color,
            colorBlendMode: colorBlendMode,
            placeholder: placeholder ?? (_, url) => Container(),
            imageBuilder: imageBuilder ?? null,
            errorWidget: errorWidget ??
                (context, url, error) {
                  log('Error image 404: $imageUrl');
                  return _errorWidget();
                },
          );
  }

  Widget _errorWidget() {
    return Padding(
      padding: EdgeInsets.all(4),
      child: SvgPicture.asset(
        'assets/svg/photo_broken.svg',
        width: 100,
        height: 100,
      ),
    );
  }
}
