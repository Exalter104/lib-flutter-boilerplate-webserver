import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_webserver/utils/components/utils.dart';
import 'package:flutter_boilerplate_webserver/utils/routes/routes_name.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Exarth Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                Utils.toastMessage(
                  "You Login Successfully",
                );
                Navigator.pushNamed(context, RoutesNames.login);
              },
              child: const Text(
                "Home screen ",
                style: TextStyle(color: Colors.red, fontSize: 24),
              ),
            ),
          )
        ],
      ),
    );
  }
}
