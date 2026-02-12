import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({super.key, required this.label, required this.onTap,required this.icon});
  final String label;
  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTap: onTap,
        child: Row(
          children: [
            Icon(icon, color: BlaColors.iconNormal),
            SizedBox(width: 10,),
            Text(label, style: TextStyle(color: BlaColors.textLight)),
          ],
        ),
    );
  }
}
