import 'package:my_flutter_project/model/ride_pref/ride_pref.dart';
import 'package:my_flutter_project/model/ride/ride.dart';
import 'package:my_flutter_project/dummy_data/dummy_data.dart';

class RidesService {

  static List<Ride> availableRides = fakeRides;   // TODO for now fake data

  ///
  ///  Return the relevant rides, given the passenger preferences
  ///
  static List<Ride> getRidesFor(RidePref preferences) {
    return availableRides.where((ride) =>
      ride.departureLocation == preferences.departure &&
      ride.arrivalLocation == preferences.arrival
    ).toList();
  }

  static List<Ride> getRidesForToday() {
    DateTime today = DateTime.now();
    return availableRides.where((ride) =>
      ride.departureDate.year == today.year &&
      ride.departureDate.month == today.month &&
      ride.departureDate.day == today.day
    ).toList();
  }
}

void main() {
  // Get the list of rides available today
  List<Ride> todayRides = RidesService.getRidesForToday();

  // Display the rides available today
  if (todayRides.isEmpty) {
    print('No rides available for today.');
  } else {
    print('Rides available today:');
    for (var ride in todayRides) {
      print('From ${ride.departureLocation} to ${ride.arrivalLocation} on ${ride.departureDate}');
    }
  }
}
