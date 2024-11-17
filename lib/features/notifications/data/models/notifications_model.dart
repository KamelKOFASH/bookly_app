class NotificationModel {
  final String title;
  final String body;
  final DateTime timestamp;
  final String id;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.timestamp,
  });
}
