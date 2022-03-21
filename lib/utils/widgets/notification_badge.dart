import 'package:flutter/material.dart';

class NotificationBadge extends StatelessWidget {
  final VoidCallback? onTap;
  final int notificationCount;

  const NotificationBadge({
    Key? key,
    this.onTap,
    this.notificationCount = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Stack(children: <Widget>[
        IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 40,
            ),
            onPressed: onTap),
        notificationCount != 0
            ? Positioned(
          right: 5,
          top: 11,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(18),
            ),
            constraints: const BoxConstraints(
              minWidth: 18,
              minHeight: 18,
            ),
            child: Text(
              '$notificationCount',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
            : Container()
      ]),
    );
  }
}
