import 'package:flutter/material.dart';

class NotificationIconCount extends StatelessWidget {
  const NotificationIconCount({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 27,
      width: 27,
      child: Stack(
        fit: StackFit.expand,
        children: [
           const Center(
            child: Icon(3== 3? Icons.notifications:Icons.notifications_outlined),
          ),
          // if (context
          //         .watch<AppNotificationsProvider>()
          //         .unSeenNotifications
          //         .isNotEmpty ==
          //     true)
            Align(
              alignment: const Alignment(4, -2),
              child: Container(
                height: 17,
                width: 22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text("2",
                    style: TextStyle(
                      fontSize: 10,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
