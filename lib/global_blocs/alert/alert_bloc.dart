part of 'alert.dart';

class AlertBloc extends Bloc<AlertEvent, AlertState> {
  AlertBloc() : super(AlertHidden()) {
    on<ShowAlertEvent>((event, emit) {
      emit(AlertInDisplayed(type: event.type, messageId: event.content));
    });

    on<HideAlertEvent>(
      (event, emit) {
        emit(AlertHidden());
      },
    );
  }
}
