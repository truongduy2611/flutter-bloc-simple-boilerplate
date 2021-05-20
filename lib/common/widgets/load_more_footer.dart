part of 'widgets.dart';

class LoadingFooter extends StatelessWidget {
  const LoadingFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      loadStyle: LoadStyle.ShowWhenLoading,
      builder: (context, status) {
        if (status == LoadStatus.loading) {
          return const SizedBox(
            height: 72,
            child: Center(
              child: SizedBox(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
                height: spacing * 2,
                width: spacing * 2,
              ),
            ),
          );
        }

        if (status == LoadStatus.canLoading) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: spacing),
              const Icon(Icons.arrow_upward),
              const SizedBox(height: spacing),
              Text(
                translate(Keys.release_to_load_more),
                style: context.textTheme.subtitle2,
              )
            ],
          );
        }

        if (status == LoadStatus.noMore) {
          return const SizedBox(); // NoMoreItemContainer(dense: true);
        }

        if (status == LoadStatus.failed) {
          return const ErrorContainer(dense: true);
        }

        return const SizedBox();
      },
    );
  }
}
