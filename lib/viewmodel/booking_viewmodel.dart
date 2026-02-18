enum LocationType { departure, arrival }

class BookingViewmodel {
  String? departure;
  String? arrive ;
  int defualtSeat = 1;
  DateTime defualtDate = DateTime.now();


  void setDeparture(String value) {
      departure = value;
  }

  void setArrival(String value) {
      arrive = value;

  }
}
