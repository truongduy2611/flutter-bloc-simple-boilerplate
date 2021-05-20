part of 'alert.dart';

@immutable
abstract class AlertEvent extends Equatable {
  @override
  List<Object> get props => [];
}

enum AlertType {
  loading,
  info,
  error,
}

class ShowAlertEvent extends AlertEvent {
  final AlertType type;
  final String content;

  ShowAlertEvent({required this.type, required this.content});

  ShowAlertEvent.loading({
    this.content = Keys.default_loading_message,
  }) : type = AlertType.loading;

  @override
  List<Object> get props => [content, type];
}

class HideAlertEvent extends AlertEvent {
  HideAlertEvent();
}
