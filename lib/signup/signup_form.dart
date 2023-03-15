import 'package:flutter/material.dart';
import 'package:todo/constant/routes_table.dart';

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

// TODO: Signup Form
// TODO: OTP Form

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    return SignupFormWrapper(
      child: Form(
        child: Column(
          children: [
            const SizedBox(height: 50),
            TextFormField(
              validator: (value) {
                if (value == null) {
                  return "Enter Your Name";
                }
                return null;
              },
              cursorHeight: 20,
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 25, 0),
                  child: Container(
                    width: 2,
                    height: 15,
                    color: Colors.black26,
                  ),
                ),
                hintText: "Enetr Name",
                hintStyle: const TextStyle(fontSize: 18),
                filled: true,
                fillColor: const Color.fromARGB(174, 234, 217, 169),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              validator: (value) {
                if (value == null) {
                  return "Enter Your Name";
                }
                return null;
              },
              cursorHeight: 20,
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 25, 0),
                  child: Container(
                    width: 2,
                    height: 15,
                    color: Colors.black26,
                  ),
                ),
                hintText: "Enetr Mobile Number",
                hintStyle: const TextStyle(fontSize: 18),
                filled: true,
                fillColor: const Color.fromARGB(174, 234, 217, 169),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              validator: (value) {
                if (value == null) {
                  return "Enter Your Name";
                }
                return null;
              },
              cursorHeight: 20,
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                suffix: GestureDetector(
                  child: const Text(
                    "Send OTP",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteTable.signupOtp);
                  },
                ),
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 25, 0),
                  child: Container(
                    width: 2,
                    height: 15,
                    color: Colors.black26,
                  ),
                ),
                hintText: "Enetr Email",
                hintStyle: const TextStyle(fontSize: 18),
                filled: true,
                fillColor: const Color.fromARGB(174, 234, 217, 169),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignupFormOtp extends StatefulWidget {
  const SignupFormOtp({super.key});

  @override
  State<SignupFormOtp> createState() => _SignupFormOtpState();
}

class _SignupFormOtpState extends State<SignupFormOtp> {
  @override
  Widget build(BuildContext context) {
    return SignupFormWrapper(
      hasAppbar: true,
      child: Form(
        child: Column(
          children: [
            TextFormField(
              cursorHeight: 25,
            ),
            TextFormField(
              cursorHeight: 25,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteTable.home,
                  (route) => false,
                );
              },
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
