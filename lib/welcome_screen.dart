import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: const TextSpan(
                text: 'Always Care Your',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    fontSize: 16),
                children: [
                  TextSpan(
                      text: ' Plants', style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 69, 158, 72)),
                    elevation: MaterialStateProperty.all(0),
                    fixedSize: MaterialStateProperty.all(const Size(250, 40))),
                onPressed: () => {},
                child: Text('Sign In')),
            const SizedBox(height: 30),
            RichText(
              text: const TextSpan(
                text: "Doesn't have an account?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                ),
                children: [
                  TextSpan(
                      text: ' Sign Up', style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
