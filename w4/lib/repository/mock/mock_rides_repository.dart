import 'package:w4/dummy_data/dummy_data.dart';
import 'package:w4/model/ride/ride.dart';
import 'package:w4/model/ride_pref/ride_pref.dart';
import 'package:w4/repository/rides_repository.dart';
import 'package:w4/service/rides_service.dart';

class MockRidesRepository extends RidesRepository {
  final List<Ride> _rides = fakeRides;

  @override
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return _rides;
  }
}