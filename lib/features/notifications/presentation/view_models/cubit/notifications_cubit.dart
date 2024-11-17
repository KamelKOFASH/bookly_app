import 'package:bookly_app/features/notifications/data/models/notifications_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsCubit extends Cubit<List<NotificationModel>> {
  NotificationsCubit() : super([]);

  void addNotification(NotificationModel notification) {
    final updatedList = List<NotificationModel>.from(state)..add(notification);
    emit(updatedList);
  }

  void removeNotification(String id) {
    final updatedList =
        state.where((notification) => notification.id != id).toList();
    emit(updatedList);
  }
}
