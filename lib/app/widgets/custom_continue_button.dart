import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ContinueButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(
          horizontal: 130,
          vertical: 15,
        )),
        backgroundColor: const MaterialStatePropertyAll(Color(0xFF535FD8)),
        elevation: const MaterialStatePropertyAll(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Border radius value
          ),
        ),
      ),
      child: const Text(
        'Next',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
