import 'package:blabla/model/ride/locations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blabla/services/rides_service.dart';

void main() {
  test('test filter', () {
    RidesService.filterBy(
      departure: Location(name: "Dijon", country: Country.france),
      seatsRequested: 2,
    );

  });
}
