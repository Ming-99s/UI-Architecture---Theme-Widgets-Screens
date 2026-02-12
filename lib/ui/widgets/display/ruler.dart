import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class Ruler extends StatelessWidget {
  const Ruler({super.key});

  @override
  Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
        children: [
          const SizedBox(height: 8),
        
          Divider(color: BlaColors.iconLight, thickness: 1,),
        
          const SizedBox(height: 8),
        ],
            ),
      );
  }
}