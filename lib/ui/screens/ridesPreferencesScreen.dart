import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/actions/blabutton.dart';
import 'package:blabla/ui/widgets/display/locationsList.dart';
import 'package:blabla/ui/widgets/display/ruler.dart';
import 'package:blabla/ui/widgets/inputs/input.dart';
import 'package:blabla/viewmodel/booking_viewmodel.dart';
import 'package:flutter/material.dart';

class Ridespreferencesscreen extends StatefulWidget {
  const Ridespreferencesscreen({super.key});

  @override
  State<Ridespreferencesscreen> createState() => _RidespreferencesscreenState();
}

class _RidespreferencesscreenState extends State<Ridespreferencesscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
   
        child: Blabutton(
          label: 'Search',
          onPressed: () => {},
          isRound: false,
          icon: Icons.abc,
          color: ColorType.primary,
        ),
      ),
    );
  }
}
