import 'package:w4/model/ride/locations.dart';
import 'package:w4/repository/locations_repository.dart';
import '../dummy_data/dummy_data.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  static const List<Location> availableLocations = fakeLocations;
  static LocationsService? _instance;
  
  final LocationsRepository repository;

  LocationsService._internal(this.repository);
  
  List<Location> getLocations() {
    return repository.getLocations();
  }
  static void initialize (LocationsRepository repository) {
    if (_instance == null) {
      LocationsService._internal(repository);
    }
  }
  static LocationsService get instance {
    if (_instance == null) {
     throw Exception('LocationsService is not initialized');
    }
    return _instance!;
  }
}
