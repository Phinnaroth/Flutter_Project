import 'package:flutter/material.dart';
import 'package:w4/screens/rides/widgets/ride_pref_bar.dart';
import 'package:w4/screens/rides/widgets/ride_pref_modal.dart';
import '../../model/ride/ride.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../service/rides_service.dart';
import '../../theme/theme.dart';
import 'widgets/rides_tile.dart';

///
///  The Ride Selection screen allows the user to select a ride, 
///  update ride preferences, and activate filters.
///
class RidesScreen extends StatefulWidget {
  const RidesScreen({super.key});

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {
  late RidePreference currentPreference;
  late List<Ride> matchingRides;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  /// Load initial ride preference and matching rides from the service
  void _loadData() {
    final ridesService = RidesService.instance;
    currentPreference = ridesService.getCurrentPreference();
    matchingRides = ridesService.getRides(currentPreference, null);
  }

  void onBackPressed() {
    Navigator.of(context).pop(); // Back to the previous view
  }

  void onPreferencePressed() async {
     // Open modal with current preference
    final newPreference = await Navigator.push<RidePreference>(
      context,
      MaterialPageRoute(builder: (context) => RidePrefModal(currentPreference: currentPreference)));
    // If a new preference was selected, update and refresh the view
    if (newPreference != null) {
      setState(() {
        currentPreference = newPreference;
      });
      _loadData();  // Refresh matching rides based on the updated preference
    }
    // TODO 6: Open modal with current preference
    // TODO 9: Retrieve new preference after modal closes
    // TODO 10: Update service with new preference and refresh view
  }

  void onFilterPressed() {
    // TODO: Implement filter functionality
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: BlaSpacings.m, right: BlaSpacings.m, top: BlaSpacings.s),
        child: Column(
          children: [
            // Top search bar
            RidePrefBar(
              ridePreference: currentPreference,
              onBackPressed: onBackPressed,
              onPreferencePressed: onPreferencePressed,
              onFilterPressed: onFilterPressed,
            ),

            // List of available rides
            Expanded(
              child: ListView.builder(
                itemCount: matchingRides.length,
                itemBuilder: (ctx, index) => RideTile(
                  ride: matchingRides[index],
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
