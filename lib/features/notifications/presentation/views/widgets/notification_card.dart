import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(
            FontAwesomeIcons.bell,
          ),
        ),
        title: Text('Notification title', style: Styles.textStyle16),
        subtitle: Text('Notification description',
            style: Styles.textStyle14.copyWith(color: Colors.grey)),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.close),
        ),
      ),
    );
  }
}
