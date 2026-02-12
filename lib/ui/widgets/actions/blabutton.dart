import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';

enum ColorType { primary, secondary }

class Blabutton extends StatelessWidget {
  const Blabutton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
    this.icon,
    this.isRound
  });
  final String label;
  final Function() onPressed;
  final ColorType? color;
  final IconData? icon;
  final bool? isRound;

  Color get getColor {
    if (color == ColorType.secondary) {
      return BlaColors.white;
    }
    return BlaColors.primary;
  }

  Color get getTextColor {
    if (color == ColorType.secondary) {
      return BlaColors.primary;
    }
    return BlaColors.white;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        
        style: ElevatedButton.styleFrom(
          shape: isRound != true ? RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(0)
          ) : RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
          backgroundColor: getColor),
        onPressed: onPressed,
      
        child: icon != null
            ? Row(mainAxisAlignment: MainAxisAlignment.center,children: [Icon(Icons.iron,color: getTextColor,),SizedBox(width: 10,), Container(padding: EdgeInsets.symmetric(vertical: 10),child: Text(label,style: TextStyle(color:getTextColor )))])
            : Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(label,style: TextStyle(color:getTextColor ),)),
      ),
    );
  }
}
