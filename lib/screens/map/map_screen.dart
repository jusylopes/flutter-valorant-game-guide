import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_valorant_game_guide/blocs/map/map_bloc.dart';
import 'package:flutter_valorant_game_guide/blocs/map/map_state.dart';
import 'package:flutter_valorant_game_guide/models/enum/bloc_status.dart';
import 'package:flutter_valorant_game_guide/models/map_model.dart';
import 'package:flutter_valorant_game_guide/screens/map/widgets_map/map_card.dart';
import 'package:flutter_valorant_game_guide/screens/widgets/circular_progress_indicator_app.dart';
import 'package:flutter_valorant_game_guide/screens/widgets/error_message_app.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with AutomaticKeepAliveClientMixin<MapScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: BlocBuilder<MapBloc, MapState>(builder: (context, state) {
        switch (state.status) {
          case BlocStatus.initial:
          case BlocStatus.loading:
            return const CircularProgressIndicatorApp();
          case BlocStatus.success:
            return ListView.separated(
              padding: const EdgeInsets.all(20),
              separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
              itemCount: state.maps.length,
              itemBuilder: (_, index) {
                final MapModel map = state.maps[index];

                return MapCard(map: map);
              },
            );
          case BlocStatus.error:
            return ErrorMessageApp(
              errorMessage: state.errorMessage!,
            );
        }
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
