import '../model/locations.dart';
import 'locations_repository.dart';

///
///
class FrenchLocationsRepository extends LocationsRepository {
  final Location paris = Location(name: 'Paris', country: Country.france);
  final Location toulouse = Location(name: 'Toulouse', country: Country.france);
  
  @override
  List<Location> getLocations() {
    return [paris, toulouse];
  }
}