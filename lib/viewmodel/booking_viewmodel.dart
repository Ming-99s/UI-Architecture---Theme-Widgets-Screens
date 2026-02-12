enum LocationType { departure, arrival }

class BookingViewmodel {
  String departure = 'Selected Departure';
  String arrive = 'Selected Arrival';
  int defualtSeat = 1;
  DateTime defualtDate = DateTime.now();

  String? locationError;

  void setDeparture(String value) {
    locationError = null;
    if (value != arrive) {
      departure = value;
    } else {
      locationError = 'Location departure and arrival can not be the same';
      departure = 'Selected Departure';
    }
  }

  void setArrival(String value) {
    locationError = null;

    if (value != departure) {
      arrive = value;
    } else {
      arrive = 'Selected Arrival';
      locationError = 'Location departure and arrival can not be the same';
    }
  }
}
