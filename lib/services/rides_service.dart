import 'package:blabla/model/ride/locations.dart';

import '../data/dummy_data.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static List<Ride> allRides = fakeRides;
  RidesService(List<Ride> fakeRides);

  // TODO Create a static method to filter rides by departure location
  static List<Ride> filterByDeparture(Location departure) {

    return allRides
        .where((ride) => ride.departureLocation.name == departure.name)
        .toList();
  }



  // TODO Create a static method to filter rides by number of requested seat
  static List<Ride> filterBySeatRequested(int seatRequested) {
    return allRides
        .where((ride) => ride.availableSeats >= seatRequested)
        .toList();
  }

  // TODO Create a static method to filter : optional departure location, optional requested seat
  static List<Ride> filterBy({Location? departure, int? seatsRequested}) {
    if (departure != null && seatsRequested != null) {
      return allRides
          .where(
            (ride) =>
                ride.departureLocation.name == departure.name &&
                ride.availableSeats >= seatsRequested,
          )
          .toList();
    }
    if (departure != null) {
      return allRides
          .where((ride) => ride.departureLocation.name == departure.name)
          .toList();
    }
    if (seatsRequested != null) {
      return allRides
          .where((ride) => ride.availableSeats >= seatsRequested)
          .toList();
    }
    return allRides;
  }


}
