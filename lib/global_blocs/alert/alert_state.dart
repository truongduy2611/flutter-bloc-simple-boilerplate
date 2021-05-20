part of 'alert.dart';

abstract class AlertState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AlertInDisplayed extends AlertState {
  AlertInDisplayed({
    required this.type,
    required this.messageId,
    this.titleId,
  });

  final AlertType type;
  final String messageId;
  final String? titleId;

  @override
  List<Object?> get props => [type, messageId, titleId];

  @override
  String toString() {
    return 'AlertInDisplay $messageId';
  }
}

class AlertHidden extends AlertState {}
