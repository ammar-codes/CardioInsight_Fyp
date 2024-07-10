import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Image.asset('assets/images/topImage.png'),
                  const SizedBox(height: 16),
                  const Text("Register Account", style: headingStyle),

                  const SizedBox(height: 16),
                  const SignUpForm(),

                  const SizedBox(height: 10),
                  Text(
                    'By continuing your confirm that you agree \nwith our Term and Condition',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
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
