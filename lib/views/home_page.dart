import 'package:flutter/material.dart';
import 'package:flutter_valorant_game_guide/resources/colors.dart';
import 'package:flutter_valorant_game_guide/resources/strings.dart';
import 'package:flutter_valorant_game_guide/views/agents_page.dart';

class AgentHomePage extends StatelessWidget {
  const AgentHomePage({super.key});

  static const List<Tab> myTabs = <Tab>[
    Tab(child: Text('Agents')),
    Tab(child: Text('Weapons')),
    Tab(child: Text('Maps')),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: Image.asset('assets/images/valorant-logo.png'),
              ),
              const Text(
                ValorantStrings.appName,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          bottom: TabBar(
              labelStyle: TextStyle(
                  fontSize: 18.0, fontFamily: ValorantStrings.productSansFont),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                    width: 3.0, color: ValorantColors.secondaryColor),
                insets: EdgeInsets.symmetric(horizontal: 50.0),
              ),
              unselectedLabelColor: Colors.grey,
              labelColor: ValorantColors.secondaryColor,
              tabs: myTabs),
        ),
        body: const TabBarView(children: [
          AgentsPage(),
        ]),
      ),
    );
  }
}
