import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
  });
  final DateTime initialDate;
  final Function(DateTime) onDateSelected;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  Widget buildDaysForMonth(DateTime month) {
    final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);
    final totalDays = lastDayOfMonth.day;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: totalDays,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemBuilder: (context, index) {
        final day = index + 1;
        final cellDate = DateTime(month.year, month.month, day);

        final isSelected =
            selectedDate.day == cellDate.day &&
            selectedDate.month == cellDate.month &&
            selectedDate.year == cellDate.year;

        final now = DateTime.now();
        final isToday =
            now.day == cellDate.day &&
            now.month == cellDate.month &&
            now.year == cellDate.year;

        final today = DateTime(now.year, now.month, now.day);

        Color textColor = isSelected
            ? BlaColors.white
            : cellDate.isBefore(today)
            ? BlaColors.textLight
            : BlaColors.textNormal;

        return GestureDetector(
          onTap: () {
            setState(() {
              if (!cellDate.isBefore(today)) {
                selectedDate = cellDate;
                Navigator.pop(context);
              }
            });
            widget.onDateSelected(selectedDate);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? BlaColors.primary : Colors.transparent,
                border: isSelected
                    ? null
                    : isToday
                    ? Border.all(color: BlaColors.textNormal, width: 2)
                    : null,
              ),
              child: Text(
                day.toString(),
                style: TextStyle(color: textColor),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildRowOfDay() {
    List<String> dayofweek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return Row(
      children: dayofweek.map((eachday) {
        return Expanded(
          child: Text(
            eachday,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: BlaColors.textNormal,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final months = List.generate(
      12,
      (m) => DateTime(DateTime.now().year, m + now.month),
    );
    return Scaffold(
      backgroundColor: BlaColors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: BlaColors.white,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close, color: BlaColors.primary),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'When are you going?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: BlaColors.textNormal,
                ),
              ),
            ),
          ),

          SliverPersistentHeader(
            pinned: true,
            delegate: _SimpleHeaderDelegate(
              height: 40,
              child: Container(
                color: BlaColors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                child: buildRowOfDay(),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      months[index].year > (now.year)
                          ? DateFormat('MMMM yyyy').format(months[index])
                          : DateFormat('MMMM').format(months[index]),
                      style: TextStyle(
                        color: BlaColors.textNormal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(height: 10),
                    buildDaysForMonth(months[index]),
                    SizedBox(height: 10),
                  ],
                );
              }, childCount: months.length),
            ),
          ),
        ],
      ),
    );
  }
}

class _SimpleHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget child;

  _SimpleHeaderDelegate({required this.height, required this.child});

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      decoration: BoxDecoration(
        // color: BlaColors.white,
        border: overlapsContent
            ? Border(
                bottom: BorderSide(
                  color: const Color.fromARGB(255, 158, 157, 157),
                  width: 1,
                ),
              )
            : null,
      ),
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
