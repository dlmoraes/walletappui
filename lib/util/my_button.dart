import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String iconImagePath;
  final String buttonText;
  final bool centerText;
  final bool breakLine;
  final bool dense;

  const MyButton({
    Key? key,
    required this.iconImagePath,
    required this.buttonText,
    this.centerText = false,
    this.breakLine = false,
    this.dense = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(dense ? 28 : 16),
          height: 90,
          width: size.width * 0.26,
          decoration: BoxDecoration(
              color: Colors.white.withAlpha(160),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.withAlpha(60),
                  blurRadius: 30,
                  spreadRadius: 10,
                ),
              ]),
          child: Center(
            child: Image.asset(
              iconImagePath,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          buttonText,
          textAlign: centerText ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: breakLine ? 16 : 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        )
      ],
    );
  }
}
