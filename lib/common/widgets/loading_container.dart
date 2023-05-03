part of 'widgets.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({
    Key? key,
    this.messageId = Keys.default_loading_message,
    this.icon = Icons.search,
    this.color = Colors.grey,
  }) : super(key: key);

  final String messageId;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: spacing),
          const SizedBox(
            height: spacing * 2,
            width: spacing * 2,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          const SizedBox(height: spacing),
          Text(
            translate(messageId),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: spacing),
        ],
      ),
    );
  }
}
