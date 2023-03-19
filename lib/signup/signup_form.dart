import 'package:flutter/material.dart';
import 'package:todo/api/signup.dart';
import 'package:todo/common/app_provider.dart';
import 'package:todo/constant/routes_table.dart';
import 'package:todo/signup/signup_form_wrapper.dart';

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
      SignUpApi.sendOtp();
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
