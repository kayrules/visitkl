import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartButton extends StatelessWidget {
  final BuildContext context;
  const StartButton({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Button color
        foregroundColor: Colors.black, // Text color
        minimumSize: const Size(100, 45), // Button height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(color: Colors.grey),
        ),
        elevation: 1.0, // Button shadow
      ),
      onPressed: onPressed,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image:
                AssetImage('assets/images/dbkl-icon.png', package: 'visitkl'),
            height: 30,
          ),
          SizedBox(width: 12),
          Text(
            'Visitkl',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  void onPressed() {
    Get.toNamed('/visitkl');
  }
}
