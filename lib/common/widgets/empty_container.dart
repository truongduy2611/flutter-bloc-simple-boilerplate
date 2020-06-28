part of 'widgets.dart';

class EmptyContainer extends StatelessWidget {
  const EmptyContainer({
    Key key,
    this.messageId = Keys.default_empty_message,
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
          Icon(
            icon,
            color: color,
            size: 64,
          ),
          Padding(
            padding: const EdgeInsets.all(spacing * 2),
            child: Text(
              translate(messageId),
              textAlign: TextAlign.center,
              style: context.headline6,
            ),
          )
        ],
      ),
    );
  }
}
