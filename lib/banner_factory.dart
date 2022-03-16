enum BannerType {
  video,
  image,
  animation,
}

abstract class Banner {
  // ignore: missing_return
  factory Banner(BannerType type) {
    switch (type) {
      case BannerType.video: return VideoBanner();
      case BannerType.image: return ImageBanner();
      case BannerType.animation: return AnimationBanner();
    }
  }

  dynamic parseModel();

  String urlBanner();

}

class VideoBanner implements Banner{

  @override
  String urlBanner() {
    throw UnimplementedError();
  }

  @override
  parseModel() {
    throw UnimplementedError();
  }

}

class ImageBanner implements Banner{

  @override
  String urlBanner() {
    throw UnimplementedError();
  }

  @override
  parseModel() {
    throw UnimplementedError();
  }

}

class AnimationBanner implements Banner{

  @override
  String urlBanner() {
    throw UnimplementedError();
  }

  @override
  parseModel() {
    throw UnimplementedError();
  }
}