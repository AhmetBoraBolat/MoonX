import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/home/main/viewmodel/Weather/main_page_weather_view_model.dart';
import 'package:provider/provider.dart';

class CustomCalendarButton extends StatefulWidget {
  const CustomCalendarButton({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomCalendarButton> createState() => _CustomCalendarButtonState();
}

class _CustomCalendarButtonState extends State<CustomCalendarButton> {
  DateTime? _selectedDate;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenSize.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: ScreenSize.screenWidth * 0.01,
      top: ScreenSize.screenHeight * 0.055,
      child: GestureDetector(
        onTap: () {
          _selectDate(context);
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(60, 63, 65, 97),
          ),
          child: Text(
            DateFormat('d MMM yyyy').format(_selectedDate ?? DateTime.now()),
            style: const TextStyle(
              color: Color(0xFF535FD8),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime maxDate = currentDate.add(const Duration(days: 15));

    final DateTime? picked = await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: 300.0,
            height: 300.0,
            child: CalendarDatePicker(
              initialDate: _selectedDate ?? currentDate,
              firstDate: currentDate,
              lastDate: maxDate,
              onDateChanged: (DateTime newDate) {
                setState(() {
                  _selectedDate = newDate;
                  context
                      .read<MainPageWeatherViewModel>()
                      .changeCalendarDate(_selectedDate!);
                });
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}
