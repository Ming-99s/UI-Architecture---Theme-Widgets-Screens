import 'package:blabla/utils/date_time_utils.dart';

enum LocationType { departure, arrival }

class BookingViewmodel {
  String? departure;
  String? arrive ;
  int seat = 1;
  DateTime date = DateTime.now();


  void setDeparture(String value) {
      departure = value;
  }

  void setArrival(String value) {
      arrive = value;

  }
  void setDate(DateTime value) {
    date = value;
  }
  void setSeat(int value) {
    seat = value;
  }
}
