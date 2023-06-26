import 'package:flutter/material.dart';
import 'package:flutter_valorant_game_guide/resources/colors.dart';
import 'package:flutter_valorant_game_guide/views/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: const Offset(0, -0.4),
      end: const Offset(0, -0.5),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AgentHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ValorantColors.primaryColor,
      body: SlideTransition(
        position: _animation,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset('assets/images/valorant-logo.png'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}