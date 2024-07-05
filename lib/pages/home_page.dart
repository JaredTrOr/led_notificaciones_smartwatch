import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (context, shape, child) {
        return AmbientMode(
          builder: (context, mode, child) {
            return const Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlutterLogo(),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text('Notificaciones'),
                      )
                    ],
                  ),
                ));
          },
        );
      },
    );
  }
}
