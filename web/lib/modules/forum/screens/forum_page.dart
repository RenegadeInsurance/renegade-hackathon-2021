import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:uuid/uuid.dart';
import 'package:we_alert/modules/forum/bloc/forum_cubit/forum_cubit.dart';
import 'package:we_alert/modules/forum/screens/assessment_page.dart';
import 'package:we_alert/modules/forum/widgets/custom_drop_down.dart';
import 'package:we_alert/modules/forum/widgets/custom_sign_up_button.dart';
import 'package:we_alert/modules/forum/widgets/custom_text_field.dart';
import 'package:we_alert/modules/home/bloc/geoLocationBloc/geolocationbloc_bloc.dart';
import 'package:we_alert/modules/home/constants/color_const.dart';
import 'package:we_alert/modules/home/widgets/address_search.dart';

class ForumPage extends StatelessWidget {
  ForumPage({Key? key, required this.forumCubit}) : super(key: key);

  final ForumCubit forumCubit;

  //Controller to animate map upon getting new position
  final Completer<GoogleMapController> cont = Completer();
  //Function to animate map to the current user location
  Future<void> _animatetocurrentlocation(CameraPosition newposition) async {
    final GoogleMapController controller = await cont.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(newposition));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: forumCubit,
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Personal Details',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    Expanded(
                        child: CustomTextField(
                            hintext: 'Name', ispassword: false)),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: CustomTextField(
                            hintext: 'Email', ispassword: false)),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    Expanded(
                        flex: 4,
                        child:
                            CustomTextField(hintext: 'Age', ispassword: false)),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 6,
                        child: CustomDropDown(
                            hintext: 'Gender',
                            items: ["Male", "Female", "Others"])),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomTextField(
                    hintext: 'Your Contact Number', ispassword: false),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: BlocBuilder<GeolocationblocBloc, GeolocationblocState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text("Add your location",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600)),
                          ),
                          Container(
                            height: 140,
                            decoration: BoxDecoration(
                              color: ColorConstants.mapBgColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: BlocBuilder<GeolocationblocBloc,
                                  GeolocationblocState>(
                                builder: (context, state) {
                                  return GoogleMap(
                                    markers: state.markers,
                                    myLocationButtonEnabled: false,
                                    myLocationEnabled: true,
                                    initialCameraPosition: const CameraPosition(
                                        target: LatLng(87.5, 27.2), zoom: 11),
                                    onMapCreated:
                                        (GoogleMapController controller) {
                                      cont.complete(controller);
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          BlocConsumer<GeolocationblocBloc,
                              GeolocationblocState>(
                            listener: (context, state) {
                              _animatetocurrentlocation(CameraPosition(
                                  target: LatLng(state.position.latitude,
                                      state.position.longitude),
                                  zoom: 15));
                            },
                            builder: (context, state) {
                              return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 10),
                                  child: state.geoLocationStatus ==
                                          GeoLocationStatus.loaded
                                      ? const SizedBox()
                                      : CustomSignUpButton(
                                          isloading: state.geoLocationStatus ==
                                              GeoLocationStatus.loading,
                                          bordercolor:
                                              ColorConstants.signUpbuttonColor,
                                          buttoncolor:
                                              ColorConstants.signUpbuttonColor,
                                          title: "Use GPS",
                                          onPressed: state.geoLocationStatus ==
                                                  GeoLocationStatus.loaded
                                              ? () {}
                                              : () async {
                                                  bool serviceEnabled;
                                                  LocationPermission permission;
                                                  serviceEnabled = await Geolocator
                                                      .isLocationServiceEnabled();
                                                  if (!serviceEnabled) {
                                                    showTopSnackBar(
                                                      context,
                                                      const CustomSnackBar
                                                          .error(
                                                        message:
                                                            "Location services are disabled",
                                                      ),
                                                    );
                                                    return;
                                                  }
                                                  permission = await Geolocator
                                                      .checkPermission();
                                                  if (permission ==
                                                      LocationPermission
                                                          .denied) {
                                                    permission = await Geolocator
                                                        .requestPermission();
                                                    if (permission ==
                                                        LocationPermission
                                                            .denied) {
                                                      showTopSnackBar(
                                                        context,
                                                        const CustomSnackBar
                                                            .error(
                                                          message:
                                                              "Location permissions are denied",
                                                        ),
                                                      );
                                                      return;
                                                    }
                                                  }
                                                  if (permission ==
                                                      LocationPermission
                                                          .deniedForever) {
                                                    showTopSnackBar(
                                                      context,
                                                      const CustomSnackBar
                                                          .error(
                                                        message:
                                                            "Location permissions are permanently denied, we cannot request permissions",
                                                      ),
                                                    );
                                                    // Permissions are denied forever, handle appropriately.
                                                    return;
                                                  }
                                                  context
                                                      .read<
                                                          GeolocationblocBloc>()
                                                      .add(
                                                          GetCurrentLocationEvent());
                                                }));
                            },
                          ),
                          BlocConsumer<GeolocationblocBloc,
                              GeolocationblocState>(
                            listener: (context, state) {
                              _animatetocurrentlocation(CameraPosition(
                                  target: LatLng(state.position.latitude,
                                      state.position.longitude),
                                  zoom: 15));
                            },
                            builder: (context, state) {
                              return state.geoLocationStatus ==
                                      GeoLocationStatus.loaded
                                  ? const SizedBox()
                                  : Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: CustomSignUpButton(
                                        onPressed: () async {
                                          showSearch(
                                            context: context,
                                            delegate: AddressSearch(
                                                const Uuid().v4()),
                                          ).then((result) async {
                                            if (result == null) {
                                              return;
                                            }
                                            context
                                                .read<GeolocationblocBloc>()
                                                .add(FetchAddressDetails(
                                                    placeId: result.placeId));
                                          });
                                        },
                                        title: "Enter Manually",
                                        isloading: state.geoLocationStatus ==
                                            GeoLocationStatus.loading,
                                        bordercolor: ColorConstants
                                            .enterMannuallyBtnColor,
                                        buttoncolor: ColorConstants
                                            .enterMannuallyBtnColor,
                                      ),
                                    );
                            },
                          ),
                          BlocBuilder<GeolocationblocBloc,
                              GeolocationblocState>(
                            builder: (context, state) {
                              return state.geoLocationStatus ==
                                      GeoLocationStatus.loaded
                                  ? CustomSignUpButton(
                                      onPressed: () {
                                        context
                                            .read<GeolocationblocBloc>()
                                            .add(SetStateToInitial());
                                      },
                                      title: "Change",
                                      bordercolor:
                                          ColorConstants.signUpbuttonColor,
                                      buttoncolor:
                                          ColorConstants.scaffoldBgColour,
                                    )
                                  : const SizedBox();
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text('Flood Risk Assessment',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    margin: const EdgeInsets.all(0),
                    height: 100,
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0.2,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Survey Status:',
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                BlocBuilder<ForumCubit, ForumState>(
                                  builder: (context, state) {
                                    return Text(
                                      state.surveyResult,
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              state.surveyResult == "Incomplete"
                                                  ? Colors.grey.shade500
                                                  : state.surveyResult == "Safe"
                                                      ? Colors.green
                                                      : state.surveyResult ==
                                                              "Medium Risk"
                                                          ? Colors.orange
                                                          : Colors.red),
                                    );
                                  },
                                )
                              ],
                            )),
                        Expanded(
                            flex: 4,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Assessment(
                                            forumCubit: forumCubit)));
                              },
                              child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue.shade400),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Text('Take Survey',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Icon(Icons.arrow_forward,
                                            size: 18, color: Colors.white)
                                      ],
                                    ),
                                  )),
                            ))
                      ],
                    )),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Alert Group',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600)),
                    InkWell(
                      onTap: () {
                        showCupertinoModalBottomSheet(
                            context: context,
                            builder: (context) => Scaffold(
                                  body: SafeArea(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.all(13),
                                            child: Icon(Icons.close),
                                          ),
                                        ),
                                        const Divider(
                                          height: 2,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text('Name',
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                              SizedBox(
                                                height: 9,
                                              ),
                                              CustomTextField(
                                                  hintext: "Full Name",
                                                  ispassword: false)
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text('Relation',
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                              SizedBox(
                                                height: 9,
                                              ),
                                              CustomTextField(
                                                  hintext:
                                                      "Your relation with the personnel ",
                                                  ispassword: false)
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text('Contact',
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                              SizedBox(
                                                height: 9,
                                              ),
                                              CustomTextField(
                                                  hintext:
                                                      "Personnel contact number",
                                                  ispassword: false)
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: CustomSignUpButton(
                                              buttoncolor: ColorConstants
                                                  .signUpbuttonColor,
                                              bordercolor: ColorConstants
                                                  .signUpbuttonColor,
                                              title: "Add Alert Personnel",
                                              onPressed: () {}),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      child: const Text('+ Add alert personnel',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.green)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(8, 0, 8, 15),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0.2,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Name',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Bipin Bhandari',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Relationship',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Son',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Contact',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            '9866189986',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomSignUpButton(
                    buttoncolor: ColorConstants.signUpbuttonColor,
                    bordercolor: ColorConstants.signUpbuttonColor,
                    title: "Submit",
                    onPressed: () {})
              ],
            ),
          ),
        ),
      )),
    );
  }
}
