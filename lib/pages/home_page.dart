import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:weartest/pages/list_notification_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (context, shape, child) {
        return AmbientMode(
          builder: (context, mode, child) {
            return ListNotificationPage();
          },
        );
      },
    );
  }
}
