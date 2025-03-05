import 'package:w4/model/ride/locations.dart';
import 'package:w4/model/ride/ride.dart';
import 'package:w4/model/ride_pref/ride_pref.dart';
import 'package:w4/model/user/user.dart';
import 'package:w4/repository/rides_repository.dart';
import 'package:w4/service/rides_service.dart';

class MockRidesRepository extends RidesRepository {
  final List<Ride> _rides = [
    Ride(
      departureLocation: Location(name: 'Battambang', country: Country.cambodia), 
      departureDate: DateTime(2025, 3, 6, 5, 30), 
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime(2025, 3, 6, 8, 30).add(Duration(hours: 2)),  
      driver: User(firstName: 'Kannika'), 
      availableSeats: 2, 
      pricePerSeat: 12.0),
    Ride(
      departureLocation: Location(name: 'Battambang', country: Country.cambodia), 
      departureDate: DateTime(2025, 3, 6, 8), 
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime(2025, 3, 6, 8).add(Duration(hours: 2)),  
      driver: User(firstName: 'Chaylim'), 
      availableSeats: 0,
      pricePerSeat: 12.5
    ),
    Ride(
      departureLocation: Location(name: 'Battambang', country: Country.cambodia), 
      departureDate: DateTime(2025, 3, 6, 5), 
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime(2025, 3, 6, 5).add(Duration(hours: 3)),  
      driver: User(firstName: 'Mengtech'), 
      availableSeats: 1,
      pricePerSeat: 17.0
    ),
    Ride(
      departureLocation: Location(name: 'Battambang', country: Country.cambodia), 
      departureDate: DateTime(2025, 3, 6, 8), 
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime(2025, 3, 6, 8).add(Duration(hours: 2)),  
      driver: User(firstName: 'Limhao'), 
      availableSeats: 2,
      pricePerSeat: 13.0,
      acceptPets: true
    ),
    Ride(
      departureLocation: Location(name: 'Battambang', country: Country.cambodia), 
      departureDate: DateTime(2025, 3, 6, 5), 
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime(2025, 3, 6, 5).add(Duration(hours: 3)),  
      driver: User(firstName: 'Sovanda'), 
      availableSeats: 1,
      pricePerSeat: 15.0,

    ),
  ];

  @override
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return _rides;
  }
}