part of 'widgets.dart';

enum _ImageType {
  network,
  asset,
  // file,
  // memory,
}

class CustomImage extends StatelessWidget {
  const CustomImage(
    this.src, {
    Key? key,
    this.height,
    this.width,
    this.fit,
    this.alignment = Alignment.center,
    this.borderRadius,
  })  : _type = _ImageType.network,
        super(key: key);

  const CustomImage.network(
    this.src, {
    Key? key,
    this.height,
    this.width,
    this.fit,
    this.alignment = Alignment.center,
    this.borderRadius,
  })  : _type = _ImageType.network,
        super(key: key);

  const CustomImage.asset(
    this.src, {
    Key? key,
    this.height,
    this.width,
    this.fit,
    this.alignment = Alignment.center,
    this.borderRadius,
  })  : _type = _ImageType.asset,
        super(key: key);

  final _ImageType _type;

  final String src;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    if (_type == _ImageType.network) {
      return Image.network(
        src,
        height: height,
        width: width,
        alignment: alignment,
        fit: fit,
      );
    }

    if (_type == _ImageType.asset) {
      return Image.asset(
        src,
        height: height,
        width: width,
        alignment: alignment,
        fit: fit,
      );
    }

    return Image.network(
      src,
      height: height,
      width: width,
      alignment: alignment,
      fit: fit,
    );
  }
}
