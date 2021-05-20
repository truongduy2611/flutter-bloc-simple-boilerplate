part of 'alert.dart';

class AlertBloc extends Bloc<AlertEvent, AlertState> {
  AlertBloc() : super(AlertHidden());

  @override
  Stream<AlertState> mapEventToState(
    AlertEvent event,
  ) async* {
    if (event is ShowAlertEvent) {
      yield AlertInDisplayed(type: event.type, messageId: event.content);
    } else {
      yield AlertHidden();
    }
  }
}
