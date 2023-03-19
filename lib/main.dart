// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Wallet/coins/coins.dart';
import 'package:todo/Wallet/meeting/meeting.dart';
import 'package:todo/Wallet/profile/profile.dart';
import 'package:todo/common/app_provider.dart';
import 'package:todo/common/helper.dart';
import 'package:todo/signup/signup_form.dart';
import 'package:todo/signup/signup_otp_form.dart';
import 'package:todo/wallet/profile/sideDrawer/side_drawer.dart';
import 'package:todo/constant/routes_table.dart';

void main() {
  runApp(const InitApp());
}

class InitApp extends StatefulWidget {
  const InitApp({super.key});

  @override
  State<InitApp> createState() => _InitAppState();
}

class _InitAppState extends State<InitApp> {
  bool isLoading = true;
  String? deviceId;

  @override
  void initState() {
    initApp();
    super.initState();
  }

  void initApp() async {
    deviceId = await Helper.getDeviceId();
    print(deviceId);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: Text("Loading"),
          ),
        ),
      );
    }
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 116, 190, 232),
          elevation: 0,
        ),
      ),
      routes: {
        RouteTable.signup: (context) => const SignupForm(),
        RouteTable.signupOtp: (context) => const SignupFormOtp(),
        RouteTable.home: (context) => const MyHomePage(),
        RouteTable.profile: (context) => const Profile(),
        RouteTable.coins: (context) => const Coins(),
        RouteTable.meetings: (context) => const Meetings(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context, listen: false);
    print("++++++++++++");
    print(provider.email);
    print(provider.userName);
    print(provider.mobileNumber);
    print("==============");
    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: Column(
        children: [
          // Text(provider.userName ?? ""),
        ],
      ),
    );
  }
}
