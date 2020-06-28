part of 'widgets.dart';

class AdaptiveContainer extends StatelessWidget {
  const AdaptiveContainer({
    Key key,
    this.sm = 4,
    this.decoration,
    this.alignment = Alignment.center,
    this.maxHeight,
    this.minHeight = 0,
    this.padding,
    @required this.child,
    this.margin,
  }) : super(key: key);

  final int sm;
  final double maxHeight;
  final double minHeight;
  final EdgeInsets padding;
  final BoxDecoration decoration;
  final Alignment alignment;
  final Widget child;
  final EdgeInsets margin;

  static double calculateWidth(context, {int sm = 4}) =>
      adaptiveWidth(
        context: context,
        columns: sm,
      ) +
      gutter(context) * 6;

  @override
  Widget build(BuildContext context) {
    final width = calculateWidth(context, sm: sm);

    return Container(
      alignment: alignment,
      child: Container(
        margin: margin,
        decoration: decoration,
        padding: padding,
        constraints: BoxConstraints(
          minWidth: width,
          maxWidth: width,
          minHeight: minHeight,
          maxHeight: maxHeight ?? double.infinity,
        ),
        child: child,
      ),
    );
  }
}
