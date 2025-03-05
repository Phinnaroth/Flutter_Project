import 'package:w4/model/ride_pref/ride_pref.dart';
import 'package:w4/repository/rides_repository.dart';

import '../dummy_data/dummy_data.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {

  static List<Ride> availableRides = fakeRides;  


  ///
  ///  Return the relevant rides, given the passenger preferences
  ///
  static List<Ride> getRidesFor(RidePreference preferences) {
 
    // For now, just a test
    return availableRides.where( (ride) => ride.departureLocation == preferences.departure && ride.arrivalLocation == preferences.arrival).toList();
  }

 static RidesService? _instance;
  
  final RidesRepository repository;

  RidesService._internal(this.repository);
  
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return repository.getRides(preference, filter);
  }
  static void initialize (RidesRepository repository) {
    if (_instance == null) {
      RidesService._internal(repository);
    }
  }
  static RidesService get instance {
    if (_instance == null) {
     throw Exception('LocationsService is not initialized');
    }
    return _instance!;
  }
 

}
class RidesFilter{
  final bool acceptPets;

  RidesFilter({this.acceptPets = false});
}