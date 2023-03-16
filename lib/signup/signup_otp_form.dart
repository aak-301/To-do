import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:todo/api/signup.dart';
import 'package:todo/signup/signup_form_wrapper.dart';

import '../constant/routes_table.dart';

class SignupFormOtp extends StatefulWidget {
  const SignupFormOtp({super.key});

  @override
  State<SignupFormOtp> createState() => _SignupFormOtpState();
}

class _SignupFormOtpState extends State<SignupFormOtp> {
  bool _resendOtp = false;
  bool _hasError = false;
  String _otpFieldValue = "";

  void _endTimer() {
    setState(() {
      _resendOtp = false;
    });
  }

  void _reSendOtp() {
    if (_otpFieldValue.isEmpty || _otpFieldValue.length != 4) {
      _hasError = true;
      setState(() {});
      return;
    } else {
      _hasError = false;
      _resendOtp = true;
    }
    setState(() {});
    SignUpApi.sendOtp();
    return;
  }

  Future<void> _validateOtp() async {
    if (_otpFieldValue.isEmpty || _otpFieldValue.length != 4) {
      _hasError = true;
      setState(() {});
      return;
    } else {
      _hasError = false;
    }
    setState(() {});
    Navigator.of(context).pushNamedAndRemoveUntil(
      RouteTable.home,
      (route) => false,
    );
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
            hasError: _hasError,
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
            onCompleted: (value) {
              setState(() {
                _otpFieldValue = value;
                _hasError = false;
              });
            },
          ),
          const SizedBox(height: 20),
          if (_hasError)
            const Text(
              "Enter correct OTP",
              style: TextStyle(color: Colors.red),
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
                  onPressed: _reSendOtp,
                  child: const Text(
                    "Resend",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
                if (_resendOtp)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CountDown(endTimer: _endTimer),
                  ),
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
              onPressed: _validateOtp,
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

class CountDown extends StatefulWidget {
  final Function endTimer;
  const CountDown({super.key, required this.endTimer});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  Timer? timer;
  Duration duration = const Duration(seconds: 59);

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  void decrementCounter() {
    setState(() {
      if (duration.inSeconds == 0) {
        timer!.cancel();
        widget.endTimer();
      }
      duration = Duration(seconds: duration.inSeconds - 1);
    });
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => decrementCounter(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text("00:${duration.inSeconds}");
  }
}
