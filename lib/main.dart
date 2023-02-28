import 'package:flutter/material.dart';
import 'package:todo/Wallet/coins/coins.dart';
import 'package:todo/Wallet/meeting/meeting.dart';
import 'package:todo/Wallet/profile/profile.dart';
import 'package:todo/common/side_drawer.dart';
import 'package:todo/constant/routes_table.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
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
    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
    );
  }
}
