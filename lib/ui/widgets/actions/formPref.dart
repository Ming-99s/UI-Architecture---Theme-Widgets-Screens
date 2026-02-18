import 'package:blabla/ui/screens/SeatSetter.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/screens/DatePickerCustom.dart';
import 'package:blabla/ui/widgets/actions/blabutton.dart';
import 'package:blabla/ui/screens/locationsList.dart';
import 'package:blabla/ui/widgets/display/ruler.dart';
import 'package:blabla/ui/widgets/inputs/input.dart';
import 'package:blabla/utils/animations_util.dart';
import 'package:blabla/utils/date_time_utils.dart';
import 'package:blabla/viewmodel/booking_viewmodel.dart';
import 'package:flutter/material.dart';

class Formpref extends StatefulWidget {
  const Formpref({super.key});

  @override
  State<Formpref> createState() => _FormprefState();
}

class _FormprefState extends State<Formpref> {
  final vm = BookingViewmodel();
  bool _isAnimate = false;

  void pickLocation(LocationType type) async {
    final result = await Navigator.push(
      context,

      RouteHelper.createBottomToTopRoute(Locationslist()),
    );
    if (result != null) {
      setState(() {
        if (type == LocationType.departure) {
          vm.setDeparture(result.name);
        }
        if (type == LocationType.arrival) {
          vm.setArrival(result.name);
        }
      });
    }
  }

  void swapLocation() {
    setState(() {
      _isAnimate = true;
    });

    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        final temp = vm.departure;
        vm.departure = vm.arrive;
        vm.arrive = temp;
        _isAnimate = false;
      });
    });
  }

  void pickDate(BuildContext context) {
    Navigator.push(
      context,
      RouteHelper.createBottomToTopRoute(
        CustomDatePicker(
          initialDate: vm.date,
          onDateSelected: (pickeDate) {
            setState(() {
              vm.setDate(pickeDate);
            });
          },
        ),
      ),
    );
  }

  void setSeat(BuildContext context) {
    Navigator.push(
      context,
      RouteHelper.createBottomToTopRoute(
        Seatsetter(
          value: vm.seat,
          onTap: (setSeat) {
            setState(() {
              vm.setSeat(setSeat);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 7,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(10),
        child: Container(
          decoration: BoxDecoration(color: BlaColors.white),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        AnimatedSlide(
                          offset: _isAnimate ? Offset(0, 0.5) : Offset(0, 0),
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          child: AnimatedOpacity(
                            opacity: _isAnimate ? 0.3 : 1.0,
                            duration: Duration(milliseconds: 100),
                            child: Input(
                              icon: Icons.circle_outlined,
                              label: 'Leaving from',
                              valueText: vm.departure,
                              onTap: () => pickLocation(LocationType.departure),
                            ),
                          ),
                        ),
                        Ruler(),
                        AnimatedSlide(
                          offset: _isAnimate ? Offset(0, -0.5) : Offset(0, 0),
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          child: AnimatedOpacity(
                            opacity: _isAnimate ? 0.5 : 1.0,
                            duration: Duration(milliseconds: 100),
                            child: Input(
                              icon: Icons.circle_outlined,
                              label: 'Going to',
                              valueText: vm.arrive,
                              onTap: () => pickLocation(LocationType.arrival),
                            ),
                          ),
                        ),

                        Ruler(),
                        Input(
                          valueText: DateTimeUtils.formatDateTime(vm.date),
                          label: DateTimeUtils.formatDateTime(DateTime.now()),
                          onTap: () => pickDate(context),
                          icon: Icons.calendar_month_outlined,
                        ),
                        Ruler(),
                        Input(
                          label: vm.seat.toString(),
                          onTap: () => setSeat(context),
                          icon: Icons.person,
                        ),
                      ],
                    ),
                  ),
                  Blabutton(
                    label: 'Search',
                    onPressed: () => {},
                    isRound: false,
                    color: ColorType.primary,
                  ),
                ],
              ),
              Positioned(
                right: 10,
                top: 10,
                child: AnimatedSlide(
                  offset: _isAnimate ? Offset(0, 0.2) : Offset(0, 0),
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,

                  child: AnimatedOpacity(
                    opacity: _isAnimate ? 0.5 : 1.0,
                    duration: Duration(milliseconds: 200),

                    child: vm.departure != null || vm.arrive != null
                        ? IconButton(
                            onPressed: () => swapLocation(),
                            icon: Icon(
                              Icons.swap_vert,
                              color: BlaColors.primary,
                            ),
                          )
                        : SizedBox.shrink(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
