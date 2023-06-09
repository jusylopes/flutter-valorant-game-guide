import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_valorant_game_guide/blocs/agent/agent_bloc.dart';
import 'package:flutter_valorant_game_guide/blocs/agent/agent_state.dart';
import 'package:flutter_valorant_game_guide/models/agent_model.dart';
import 'package:flutter_valorant_game_guide/models/enum/bloc_status.dart';
import 'package:flutter_valorant_game_guide/screens/widgets/circular_progress_indicator_app.dart';
import 'package:flutter_valorant_game_guide/screens/widgets/error_message_app.dart';
import 'package:flutter_valorant_game_guide/screens/agent/widgets_agent/agent_card.dart';

class AgentScreen extends StatefulWidget {
  const AgentScreen({super.key});

  @override
  State<AgentScreen> createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentScreen>
    with AutomaticKeepAliveClientMixin<AgentScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: BlocBuilder<AgentBloc, AgentState>(
        builder: (context, state) {
          switch (state.status) {
            case BlocStatus.initial:
            case BlocStatus.loading:
              return const CircularProgressIndicatorApp();
            case BlocStatus.success:
              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: state.agents.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (_, index) {
                  final AgentModel agent = state.agents[index];

                  return AgentCard(agent: agent);
                },
              );
            case BlocStatus.error:
              return ErrorMessageApp(
                errorMessage: state.errorMessage!,
              );
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
