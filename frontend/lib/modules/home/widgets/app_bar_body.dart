import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:we_alert/modules/home/bloc/geoLocationBloc/geolocationbloc_bloc.dart';

import 'address_search.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            showSearch(
              context: context,
              delegate: AddressSearch(const Uuid().v4()),
            ).then((result) async {
              if (result == null) {
                return;
              }
              context
                  .read<GeolocationblocBloc>()
                  .add(FetchAddressDetails(placeId: result.placeId));
            });
          },
          child: BlocBuilder<GeolocationblocBloc, GeolocationblocState>(
            builder: (context, state) {
              if (state.geoLocationStatus == GeoLocationStatus.loaded) {
                return Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        constraints: const BoxConstraints(maxWidth: 300),
                        child: Text(
                          '${state.address}',
                          style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        FontAwesomeIcons.chevronDown,
                        size: 18,
                        color: Colors.black,
                      )
                    ],
                  ),
                );
              } else if (state.geoLocationStatus == GeoLocationStatus.loading) {
                return const Text(
                  'Fetching data.....',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                );
              } else if (state.geoLocationStatus == GeoLocationStatus.error) {
                return const Text(
                  "Error Retry",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                );
              } else if (state.geoLocationStatus ==
                  GeoLocationStatus.uninitialized) {
                context
                    .read<GeolocationblocBloc>()
                    .add(GetCurrentLocationEvent());
                return const Text(
                  'Fetching data.....',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                );
              } else {
                return const Text(
                  "Retry",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                );
              }
            },
          ),
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
