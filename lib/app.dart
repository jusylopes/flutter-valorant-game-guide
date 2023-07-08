import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_valorant_game_guide/blocs/agent/agent_bloc.dart';
import 'package:flutter_valorant_game_guide/blocs/agent/agent_event.dart';
import 'package:flutter_valorant_game_guide/repositories/adapters/_adapter.dart';
import 'package:flutter_valorant_game_guide/repositories/repository.dart';
import 'package:flutter_valorant_game_guide/resources/strings.dart';
import 'package:flutter_valorant_game_guide/resources/theme.dart';
import 'package:flutter_valorant_game_guide/screens/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final agentRepository = Repository(dio: Dio(), adapter: AgentAdapter());

    return MultiBlocProvider(
      providers: [
        BlocProvider<AgentBloc>(
          create: (_) =>
              AgentBloc(repository: agentRepository)..add(AgentLoaded()),
        ),
      ],
      child: MaterialApp(
        theme: ValorantTheme.dark,
        debugShowCheckedModeBanner: false,
        title: ValorantStrings.appName,
        home: const SplashScreen(),
      ),
    );
  }
}
