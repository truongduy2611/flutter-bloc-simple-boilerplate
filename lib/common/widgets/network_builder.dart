part of 'widgets.dart';

Widget networkStatusBuilder(BuildContext context, Widget? child) {
  if (Platform.isIOS || Platform.isAndroid) {
    return OfflineBuilder(
      child: child,
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final isConnected = connectivity != ConnectivityResult.none;

        if (isConnected) {
          return child;
        }

        return Material(
          color: Theme.of(context).errorColor,
          child: SafeArea(
            top: true,
            bottom: false,
            right: false,
            left: false,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                MediaQuery.removeViewPadding(
                  context: context,
                  removeTop: true,
                  child: Padding(
                    padding: const EdgeInsets.only(top: spacing * 3),
                    child: child,
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    alignment: Alignment.center,
                    height: spacing * 3,
                    child: Text(
                      translate(Keys.no_internet_connection),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  return child!;
}
