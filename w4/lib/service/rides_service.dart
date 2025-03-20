import 'package:w4/model/ride_pref/ride_pref.dart';
import 'package:w4/repository/rides_repository.dart';
import '../dummy_data/dummy_data.dart';
import '../model/ride/ride.dart';

///
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static final List<Ride> availableRides = fakeRides;
  static RidesService? _instance;

  final RidesRepository repository;
  RidePreference? _currentPreference;

  RidesService._internal(this.repository);

  /// Initialize the service with a repository
  static void initialize(RidesRepository repository) {
    _instance ??= RidesService._internal(repository);
  }

  /// Get the singleton instance
  static RidesService get instance {
    if (_instance == null) {
      throw Exception('RidesService is not initialized');
    }
    return _instance!;
  }

  /// Get relevant rides based on preferences
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return repository.getRides(preference, filter);
  }

  /// Get the current ride preference (fallback to the first fake preference)
  RidePreference getCurrentPreference() {
    _currentPreference ??= fakeRidePrefs[0];
    return _currentPreference!;
  }

  /// Update the current ride preference
  void setCurrentPreference(RidePreference preference) {
    _currentPreference = preference;
  }
}

///
///  Filter class for rides
///
class RidesFilter {
  final bool acceptPets;

  RidesFilter({this.acceptPets = false});
}
