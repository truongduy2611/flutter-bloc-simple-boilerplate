part of 'widgets.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({
    Key key,
    this.messageId = Keys.default_error_message,
    this.dense = false,
    this.icon,
  }) : super(key: key);

  final String messageId;
  final bool dense;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final textStyle = dense ? textTheme.caption : textTheme.headline6;
    final textSpacing = dense ? spacing : spacing * 2.0;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          icon ??
              Icon(
                Icons.error_outline,
                color: Colors.red[300],
                size: 64,
              ),
          Padding(
            padding: EdgeInsets.all(textSpacing),
            child: Text(
              translate(messageId),
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          )
        ],
      ),
    );
  }
}
