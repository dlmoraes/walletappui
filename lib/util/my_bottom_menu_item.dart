import 'package:flutter/material.dart';

class MyBottomMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isActive;

  const MyBottomMenuItem({
    Key? key,
    required this.icon,
    required this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 60,
        child: Column(
          children: [
            Icon(
              icon,
              size: 32,
              color: isActive ? Colors.pink : Colors.grey,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            )
          ],
        ),
      ),
    );
  }
}
