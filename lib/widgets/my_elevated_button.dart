import 'package:flutter/material.dart';

class MyElevatedButtom extends StatelessWidget {
  const MyElevatedButtom({
    super.key,
    required this.addTap,
  });

  final Function() addTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: addTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: const Text(
        'Add',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
