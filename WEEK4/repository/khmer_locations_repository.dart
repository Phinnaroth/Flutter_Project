import '../model/locations.dart';
import 'locations_repository.dart';

///
///
class KhmerLocationsRepository extends LocationsRepository {
  final Location phnompenh = Location(name: 'Phnom Penh', country: Country.cambodia);
  final Location siemreap = Location(name: 'Siem Reap', country: Country.cambodia);
  
  @override
  List<Location> getLocations() {
    return [phnompenh, siemreap];
  }
}