import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_webserver/utils/routes/routes_name.dart';

class Home extends StatefulWidget {
  static const id = "navbar_controller";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController pageController = PageController(initialPage: 0);
  int pageIndexes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Dashboard",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            size: 40, //change size on your need
            color: Colors.black, //change color on your need
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/logo-red-1000.png"),
                  ),
                  accountName: Text(
                    "Exarth Boilerplate App",
                    style: TextStyle(color: Colors.black),
                  ),
                  accountEmail: Text(
                    "MyBoilerplateApp@exarth.com",
                    style: TextStyle(color: Colors.black),
                  )),
              ListTile(
                leading: const Icon(Icons.lock_open_outlined),
                title: const Text("Password Change"),
                onTap: () {
                  Navigator.pushNamed(context, RoutesNames.passwordChange);
                },
              ),
              ListTile(
                leading: const Icon(Icons.link_sharp),
                title: const Text("Password Reset"),
                onTap: () {
                  Navigator.pushNamed(context, RoutesNames.resetPassword);
                },
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Center(
              child: Text(
                "Dashboard is comming soon",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            )
          ],
        ));
  }
}
