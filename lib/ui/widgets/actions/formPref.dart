import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/actions/blabutton.dart';
import 'package:blabla/ui/widgets/actions/locationsList.dart';
import 'package:blabla/ui/widgets/display/ruler.dart';
import 'package:blabla/ui/widgets/inputs/input.dart';
import 'package:blabla/viewmodel/booking_viewmodel.dart';
import 'package:flutter/material.dart';

class Formpref extends StatefulWidget {
  const Formpref({super.key});

  @override
  State<Formpref> createState() => _FormprefState();
}

class _FormprefState extends State<Formpref> {
  final vm = BookingViewmodel();

  void pickLocation(LocationType type) async {
    final result = await showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.zero),
      ),
      context: context,
      builder: (_) => Locationslist(),
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
      final temp = vm.departure;
      vm.departure = vm.arrive;
      vm.arrive = temp;
    });
  }

  void pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: vm.defualtDate,

      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        vm.defualtDate = picked;
      });
    }
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
                        vm.locationError != null
                            ? Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                      '${vm.locationError}',
                                      style: TextStyle(color: Colors.red),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              )
                            : const SizedBox.shrink(),

                        Input(
                          icon: Icons.circle_outlined,
                          label: vm.departure,
                          onTap: () => pickLocation(LocationType.departure),
                        ),
                        Ruler(),
                        Input(
                          icon: Icons.circle_outlined,
                          label: vm.arrive,
                          onTap: () => pickLocation(LocationType.arrival),
                        ),
                        Ruler(),
                        Input(
                          label: vm.defualtDate.toIso8601String().split('T')[0],
                          onTap: () => pickDate(context),
                          icon: Icons.calendar_month_outlined,
                        ),
                        Ruler(),
                        Input(
                          label: vm.defualtSeat.toString(),
                          onTap: () => {},
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
                child: IconButton(
                  onPressed: () => swapLocation(),
                  icon: Icon(Icons.swap_vert, color: BlaColors.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
