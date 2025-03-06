import 'package:flutter_test/flutter_test.dart';
import 'package:w4/model/ride_pref/ride_pref.dart';
import 'package:w4/repository/mock/mock_rides_repository.dart';
import 'package:w4/service/rides_service.dart';
import 'package:w4/model/ride/locations.dart';

void main() {
  late RidesService ridesService;
  late MockRidesRepository mockRepository;

  setUp(() {
    // Step 1: Initialize the mock repository
    mockRepository = MockRidesRepository();

    // Step 2: Initialize the service with the mock repository
    RidesService.initialize(mockRepository);

    // Step 3: Get the instance of the service
    ridesService = RidesService.instance;

    print('Test setup complete');
  });

test('T1', () {
  final preference = RidePreference(
    departure: Location(name: 'Battambang', country: Country.cambodia),
    arrival: Location(name: 'Siem Reap', country: Country.cambodia),
    departureDate: DateTime.now(),
    requestedSeats: 1,
  );

  // Get rides from the service
  final rides = ridesService.getRides(preference, null);

  // Print the rides to show available and full rides
  print('Available Rides:');
  final availableRides = rides.where((ride) => ride.availableSeats > 0).toList();
  availableRides.forEach((ride) {
    print('Ride: ${ride.driver.firstName}, Available seats: ${ride.availableSeats}');
  });

  print('Full Rides:');
  final fullRides = rides.where((ride) => ride.availableSeats == 0).toList();
  fullRides.forEach((ride) {
    print('Ride: ${ride.driver.firstName}, Available seats: ${ride.availableSeats}(Full)');
  });

  // Expect 4 rides to be returned
  expect(rides.length, 4);

  // Check if one ride is full
  expect(fullRides.length, 1);
});


  test('T2', () {
    final preference = RidePreference(
      departure: Location(name: 'Battambang', country: Country.cambodia),
      arrival: Location(name: 'Siem Reap', country: Country.cambodia),
      departureDate: DateTime.now(),
      requestedSeats: 1,
    );

    final filter = RidesFilter(acceptPets: true);
    // Get filtered rides
    final rides = ridesService.getRides(preference, filter);

    // Print the filtered rides to inspect their details
    print('Filtered rides:');
    rides.forEach((ride) {
      print('Ride: ${ride.driver.firstName}, Pet allowed: ${ride.acceptPets}');
    });

  });
}
