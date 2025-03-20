import 'repository/khmer_locations_repository.dart';
import 'service/locations_service.dart';

void main(){
  //1.initialize service
  LocationsService.initialize(KhmerLocationsRepository());

  //2. Use service
  print(LocationsService.instance);
}