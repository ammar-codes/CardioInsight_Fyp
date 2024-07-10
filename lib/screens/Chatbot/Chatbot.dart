import 'package:flutter/material.dart';
import 'package:cardio_app/screens/Chatbot/chatbot_screen.dart';

class Chatbot extends StatelessWidget {
  static String routeName = "/Chatbot";

  const Chatbot({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(

                children: [
                  const SizedBox(height: 12),
                  Image.asset('assets/images/topImage.png'), // Image added here
                  const SizedBox(height: 20),
                  const Text(

                    "AI Your Personal Assistant",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 80),
                  const Text(
                    "This chat bot will encounter your \n queries and provide suggestion to \n your asked question in terms of \n ECG report respectively",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 120),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, chatbot_screen.routeName);} ,
                    child: const Text('Confirm'),
                  ),
                  const SizedBox(height: 12),
                  Image.asset('assets/images/heartBeat.png'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
