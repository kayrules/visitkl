import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFFDC3263),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const Text('Second Screen'),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Back to home screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed('/home');
              },
              child: const Text('Exit Visitkl'),
            ),
          ],
        ),
      ),
    );
  }
}
