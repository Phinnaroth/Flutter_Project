import '../model/locations.dart';
import '../repository/locations_repository.dart';
class LocationsService {
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