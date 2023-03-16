import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:todo/common/app_provider.dart';
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
  AppProvider provider = AppProvider();
  final _nameFocusNode = FocusNode();
  final _mobileFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _sendOTP() async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _formKey.currentState!.save();
      Navigator.of(context).pushNamed(RouteTable.signupOtp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SignupFormWrapper(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 50),
            TextFormField(
              autofocus: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Your Name";
                }
                return null;
              },
              focusNode: _nameFocusNode,
              cursorHeight: 20,
              keyboardType: TextInputType.text,
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_mobileFocusNode);
              },
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
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    width: 0,
                  ),
                ),
                hintText: "Enetr Name",
                hintStyle: const TextStyle(fontSize: 18),
                filled: true,
                fillColor: const Color.fromARGB(143, 198, 208, 215),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(192, 190, 190, 190),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(192, 190, 190, 190),
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
              onSaved: (newValue) {
                provider.userName = newValue!;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              validator: (value) {
                if (value == null) {
                  return "Enter Your Mobile Number";
                } else if (value.length != 10 || value.startsWith('0')) {
                  return "Enter correct Mobile Number";
                }
                return null;
              },
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_emailFocusNode);
              },
              onSaved: (newValue) {
                provider.mobileNumber = newValue!;
              },
              focusNode: _mobileFocusNode,
              keyboardType: TextInputType.number,
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
                fillColor: const Color.fromARGB(143, 198, 208, 215),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    width: 0,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(192, 190, 190, 190),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(192, 190, 190, 190),
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              focusNode: _emailFocusNode,
              onFieldSubmitted: (value) {
                provider.email = value;
                _sendOTP();
              },
              onSaved: (newValue) {
                provider.email = newValue!;
              },
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null) {
                  return "Enter Your Email";
                } else if (!value.contains('@')) {
                  return "Enter correct Email address";
                }
                return null;
              },
              cursorHeight: 20,
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                suffix: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: GestureDetector(
                    child: const Text(
                      "Send OTP",
                      style: TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                    onTap: () {
                      _sendOTP();
                    },
                  ),
                ),
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 25, 0),
                  child: Container(
                    width: 2,
                    height: 15,
                    color: Colors.black26,
                  ),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    width: 0,
                  ),
                ),
                hintText: "Enetr Email",
                hintStyle: const TextStyle(fontSize: 18),
                filled: true,
                fillColor: const Color.fromARGB(143, 198, 208, 215),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(192, 190, 190, 190),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(192, 190, 190, 190),
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
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
  bool resendOtp = false;

  void sendOtp() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return SignupFormWrapper(
      hasAppbar: true,
      child: Column(
        children: [
          const SizedBox(height: 30),
          OTPTextField(
            length: 4,
            width: MediaQuery.of(context).size.width,
            fieldWidth: 50,
            keyboardType: TextInputType.number,
            otpFieldStyle: OtpFieldStyle(
              borderColor: Colors.black,
              disabledBorderColor: Colors.grey,
              errorBorderColor: Colors.red,
            ),
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.underline,
            onCompleted: ((value) {
              setState(() {
                // otpController = value;
              });
            }),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Didn\'t recieved the code?',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    sendOtp();
                  },
                  child: const Text(
                    "Resend",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 150,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 1, 33, 59),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteTable.home,
                  (route) => false,
                );
              },
              child: const Text(
                "Validate",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
