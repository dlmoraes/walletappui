import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        elevation: 0,
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.pink,
                spreadRadius: 1,
                offset: Offset(0, 16),
              ),
            ],
          ),
          child: const Icon(
            Icons.monetization_on,
            size: 38,
          ),
        ),
      ),
    );
  }
}
