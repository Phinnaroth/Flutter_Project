import 'package:w4/model/ride/locations.dart';
import 'package:w4/repository/locations_repository.dart';

class MockLocationsRepository extends LocationsRepository {
  final Location phnompenh = const Location(name: 'Phnom Penh', country: Country.cambodia);
  final Location siemreap = const Location(name: 'Siem Reap', country: Country.cambodia);
  final Location battambang = const Location(name: 'Battambang', country: Country.cambodia);
  final Location sihanoukville = const Location(name: 'Sihanoukville', country: Country.cambodia);
  final Location kampot = const Location(name: 'Kampot', country: Country.cambodia);
  
  @override
  List<Location> getLocations() {
    return [phnompenh, siemreap, battambang, sihanoukville, kampot];
  }
}