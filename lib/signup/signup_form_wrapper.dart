import 'package:flutter/material.dart';

class SignupFormWrapper extends StatelessWidget {
  const SignupFormWrapper({
    super.key,
    required this.child,
    this.hasAppbar = false,
  });

  final Widget child;
  final bool hasAppbar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hasAppbar ? AppBar() : null,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "S",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text(
                  "Scheduler",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Plan your tasks and start collabrating with someone having similar mindset",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              child,
            ],
          ),
        ),
      )),
    );
  }
}