import 'package:bloc_learning/features/map/presentation/cubit/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapCubit(),
      child: Builder(
        builder: (context) {
          final mapCubit = context.read<MapCubit>();
          return Scaffold(
            body: FlutterMap(
              mapController: mapCubit.mapController,
              options: MapOptions(
                initialCenter: LatLng(39.066250645, 39.066250645), // Center the map over London, UK
                initialZoom: 12,
                onTap: (tapPosition, point) {
                  print(point.latitude);
                  print(point.longitude);
                },
              ),
              children: [
                TileLayer(
                  // Bring your own tiles
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
                  userAgentPackageName: 'com.bloc_learning', // Add your app identifier
                  // And many more recommended properties!
                ),
                BlocBuilder<MapCubit, MapState>(
                  builder: (context, state) {
                    if (state is MapLocationDetermined) {
                      return MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(state.position.latitude, state.position.longitude),
                            child: Icon(Icons.location_on, color: Colors.red, size: 30),
                          ),
                        ],
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
