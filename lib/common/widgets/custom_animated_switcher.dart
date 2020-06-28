part of 'widgets.dart';

class CustomAnimatedSwitcher extends StatelessWidget {
  const CustomAnimatedSwitcher({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: child,
      switchInCurve: const Interval(
        0.3,
        1,
        curve: Curves.easeOutQuart,
      ),
      switchOutCurve: const Interval(
        0.7,
        1,
        curve: Curves.linear,
      ),
      transitionBuilder: (child, animation) {
        Widget fadeChild;
        if (animation.status == AnimationStatus.dismissed) {
          fadeChild = ScaleTransition(
            scale: Tween<double>(begin: 0.9, end: 1).animate(animation),
            child: child,
          );
        } else {
          fadeChild = child;
        }

        return FadeTransition(
          opacity: animation,
          child: fadeChild,
        );
      },
    );
  }
}
