import 'package:flutter/material.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';

class ContinueButton extends StatefulWidget {
  final VoidCallback onPressed;

  const ContinueButton({
    super.key,
    required this.onPressed,
  });

  @override
  State<ContinueButton> createState() => _ContinueButtonState();
}

class _ContinueButtonState extends State<ContinueButton> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenSize.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
          horizontal: ScreenSize.screenWidth * 0.32,
          vertical: ScreenSize.screenHeight * 0.022,
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
