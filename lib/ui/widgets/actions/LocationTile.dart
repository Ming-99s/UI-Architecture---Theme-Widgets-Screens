import 'package:flutter/material.dart';


class LocationTile extends StatelessWidget {
  const LocationTile({
    super.key,
    required this.city,
    required this.country,
    required this.onTap,
    this.isHistoryTile,
  });
  final String city;
  final String country;
  final Function() onTap;
  final bool? isHistoryTile;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: isHistoryTile == true ? Icon(Icons.history) : null,
      title: Text(city),
      subtitle: Text(country),
      onTap: onTap,
      trailing: Icon(Icons.chevron_right),
    );
  }
}
