part of 'widgets.dart';

/// Widget shows an alert or loading over its child
/// WithDialog is connected with AppState {alert, isLoading}
/// so it will change if only {alert, isLoading} changes
class WithDialog extends StatelessWidget {
  final Widget child;

  const WithDialog({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlertBloc, AlertState>(
      builder: (context, state) {
        final visible = state is! AlertHidden;

        Widget alertContainer = const SizedBox();

        if (state is AlertInDisplayed) {
          if (state.type == AlertType.loading) {
            alertContainer = _LoadingDialog(messageId: state.messageId);
          } else {
            alertContainer = _ConfirmDialog(
              titleId: state.titleId ?? Keys.default_dialog_title,
              messageId: state.messageId,
              onDismissed: () {
                BlocProvider.of<AlertBloc>(context).add(HideAlertEvent());
              },
            );
          }
        }

        final animatedOverlay = CustomAnimatedSwitcher(
          child: alertContainer,
        );

        final dimmedBackground = visible
            ? Container(
                alignment: Alignment.center,
                color: Colors.black45,
              )
            : const SizedBox();

        return WillPopScope(
          onWillPop: () async => !visible,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              child,
              dimmedBackground,
              animatedOverlay,
            ],
          ),
        );
      },
    );
  }
}

class _ConfirmDialog extends StatelessWidget {
  const _ConfirmDialog({
    Key? key,
    required this.titleId,
    required this.messageId,
    required this.onDismissed,
  }) : super(key: key);

  final String titleId;
  final String messageId;
  final VoidCallback onDismissed;

  static const _defaultDialogShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(spacing)));

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: onDismissed,
        child: Container(
          alignment: Alignment.center,
          color: Colors.transparent,
        ),
      ),
      Center(
        child: AlertDialog(
          title: Text(translate(titleId)),
          shape: _defaultDialogShape,
          content: Text(translate(messageId)),
          actions: <Widget>[
            TextButton(
              child: Text(translate(Keys.ok)),
              onPressed: onDismissed,
            ),
          ],
        ),
      ),
    ]);
  }
}

class _LoadingDialog extends StatelessWidget {
  const _LoadingDialog({Key? key, required this.messageId}) : super(key: key);

  final String messageId;
  static const _defaultDialogShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        shape: _defaultDialogShape,
        content: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: spacing * 2,
                width: spacing * 2,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              const SizedBox(height: spacing * 2),
              Text(translate(messageId)),
            ],
          ),
        ),
      ),
    );
  }
}
