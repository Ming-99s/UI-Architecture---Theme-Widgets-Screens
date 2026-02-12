import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/services/location_service.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/actions/LocationTile.dart';
import 'package:flutter/material.dart';

class Locationslist extends StatefulWidget {
  const Locationslist({super.key});

  @override
  State<Locationslist> createState() => _LocationslistState();
}

class _LocationslistState extends State<Locationslist> {
  TextEditingController _controller = TextEditingController();

  void clearText() {
    setState(() {
      _controller.clear();
      filteredLocation = fakeLocations;
      searchText = '';
    });
  }


  List<Location> filteredLocation = fakeLocations;
  String searchText = '';

  void updateSearchBar(String value) {
    setState(() {
      searchText = value;
      filteredLocation = LocationsService.searchDepartureName(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: BlaColors.white),
      height: double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: 30),
          TextField(
            onChanged: (value) => updateSearchBar(value),

            controller: _controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: BlaColors.greyLight,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,

              labelText: 'Search',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: IconButton(
                  icon: Icon(Icons.chevron_left),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              suffixIcon: _controller.text.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: clearText,
                      ),
                    )
                  : null,
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: LocationsService.historyLocation.isNotEmpty
                  ? LocationsService.historyLocation.length + filteredLocation.length
                  : filteredLocation.length,
              itemBuilder: (context, index) {
                if (index < LocationsService.historyLocation.length) {
                  final loc = LocationsService.historyLocation[index];
                  return LocationTile(
                    city: loc.name,
                    country: loc.country.name,
                    onTap: () {
                      Navigator.pop(context, loc);
                    },
                    isHistoryTile: true,
                  );
                } else {
                  final loc = filteredLocation[index - LocationsService.historyLocation.length];
                  return LocationTile(
                    city: loc.name,
                    country: loc.country.name,
                    onTap: () {
                      if (!LocationsService.historyLocation.contains(loc)) {
                        setState(() {
                          LocationsService.historyLocation.add(loc);
                          setState(() {
                            
                          });
                        });
                      }
                      Navigator.pop(context, loc);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

