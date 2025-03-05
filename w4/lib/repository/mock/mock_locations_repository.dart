import 'package:w4/dummy_data/dummy_data.dart';
import 'package:w4/model/ride/locations.dart';
import 'package:w4/repository/locations_repository.dart';

class MockLocationsRepository extends LocationsRepository {
  final List<Location> _locations = fakeLocations;

  
  @override
  List<Location> getLocations() {
    return _locations;
  }
}