import 'package:blabla/data/dummy_data.dart';

import '../model/ride/locations.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  static const List<Location> availableLocations =
      fakeLocations; // TODO for now fake data
  static List<Location> historyLocation = [];

  static List<Location> searchDepartureName(String? departureName) {
    if (departureName == null || departureName.length < 2) {
      return availableLocations;
    }
    return availableLocations
        .where(
          (l) => l.name.toLowerCase().startsWith(departureName.toLowerCase()),
        )
        .toList();
  }

  static void addToHistory(Location loc) {
    if (!historyLocation.any((l) => l.name == loc.name)) {
      historyLocation.add(loc);
    }
  }
}
