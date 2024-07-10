import 'package:flutter/material.dart';
import 'components/medicine_form.dart';

class FavoriteScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const FavoriteScreen({super.key});
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
                  const Text(

                    "Medicine Reminder",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),
                  const MedicineForm(),
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
