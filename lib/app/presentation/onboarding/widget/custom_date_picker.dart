import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moon_x/app/core/constructor/sharedpref_key.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/core/helper/shared_preferences_helper.dart';
import 'package:moon_x/app/core/helper/zodiac_helper.dart';

class DatePickerBox extends StatefulWidget {
  const DatePickerBox({Key? key}) : super(key: key);

  @override
  State<DatePickerBox> createState() => _DatePickerBoxState();
}

class _DatePickerBoxState extends State<DatePickerBox> {
  late DateTime selectedDate;
  late String zodiacSign = '';
  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenSize.init(context);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: const Color(0xFF313234),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CupertinoButton(
                    child: const Text('Cancel',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: const Text('Done',
                        style: TextStyle(color: Color(0xFF007AFF))),
                    onPressed: () {
                      Navigator.of(context).pop(selectedDate);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: ScreenSize.screenHeight * 0.3,
                child: CupertinoDatePicker(
                  initialDateTime: selectedDate,
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      selectedDate = newDate;
                      zodiacSign = getZodiacSign(selectedDate);
                      SharedPreferencesHelper.saveStringData(
                          SharedPrefKeys.zodiac.name, zodiacSign);
                      String formattedDate =
                          DateFormat('dd/MM/yyyy').format(selectedDate);
                      SharedPreferencesHelper.saveStringData(
                          SharedPrefKeys.dateTime.name, formattedDate);
                    });
                  },
                  minimumYear: 1900,
                  maximumYear: DateTime.now().year,
                  mode: CupertinoDatePickerMode.date,
                ),
              ),
            ],
          ),
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);

    return GestureDetector(
      onTap: () async {
        await _selectDate(context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFF181D38),
        ),
        width: ScreenSize.screenWidth * 0.8,
        height: ScreenSize.screenHeight * 0.065,
        alignment: Alignment.center,
        child: Text(
          formattedDate,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
