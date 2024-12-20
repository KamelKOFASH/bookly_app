import 'package:bookly_app/features/notifications/presentation/views/widgets/custom_notification_app_bar.dart';
import 'package:bookly_app/features/notifications/presentation/views/widgets/notification_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNotificationAppBar(
        isNotificationView: false,
        title: S.of(context).notifications,
      ),
      body: const NotificationViewBody(),
    );
  }
}



