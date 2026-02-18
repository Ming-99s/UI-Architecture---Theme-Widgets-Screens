import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/actions/blabutton.dart';
import 'package:flutter/material.dart';

class Seatsetter extends StatefulWidget {
  const Seatsetter({super.key, required this.value, required this.onTap});
  final int value;
  final Function(int setSeat) onTap;

  @override
  State<Seatsetter> createState() => _SeatsetterState();
}

class _SeatsetterState extends State<Seatsetter> {
  late int seatNum;

  @override
  void initState() {
    super.initState();
    seatNum = widget.value;
  }

  void increase() {
    setState(() {
      if (seatNum < 8) {
        seatNum++;
      }
    });
  }

  void decrease() {
    setState(() {
      if (seatNum > 1) {
        seatNum--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlaColors.white,
      appBar: AppBar(
        surfaceTintColor: BlaColors.white,
        backgroundColor: BlaColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close, color: BlaColors.primary),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Number of seat to book',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: BlaColors.textNormal,
                ),
              ),

              ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    border: Border.all(color: BlaColors.primary),
                  ),
                  child: IconButton(
                    onPressed: decrease,
                    icon: Icon(Icons.remove),
                    color: BlaColors.primary,
                  ),
                ),
                title: Center(
                  child: Text(
                    seatNum.toString(),
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: BlaColors.textNormal,
                    ),
                  ),
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: BlaColors.primary),
                  ),

                  child: IconButton(
                    onPressed: increase,
                    icon: Icon(Icons.add),
                    color: BlaColors.primary,
                  ),
                ),
              ),
              Blabutton(
                label: 'Confirm',
                onPressed: () {
                  widget.onTap(seatNum);
                  Navigator.pop(context);
                },
                isRound: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
