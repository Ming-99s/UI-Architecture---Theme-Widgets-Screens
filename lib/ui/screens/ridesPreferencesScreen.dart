import 'package:blabla/services/location_service.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/actions/LocationTile.dart';
import 'package:blabla/ui/widgets/actions/blabutton.dart';
import 'package:blabla/ui/widgets/actions/formPref.dart';
import 'package:blabla/ui/screens/locationsList.dart';
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,

              children: [
                Image.asset('./assets/images/blabla_home.png'),
                Positioned(
                  top: 20,
                  child: Column(
                    children: [
                      SafeArea(
                        child: Text(
                          'Your pick of ride low price',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Transform.translate(
              offset: Offset(0, -height * 0.12),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: Formpref(),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
