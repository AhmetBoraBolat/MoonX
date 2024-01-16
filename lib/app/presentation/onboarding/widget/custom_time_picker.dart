import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moon_x/app/core/constructor/sharedpref_key.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/core/helper/shared_preferences_helper.dart';

class TimePickerBox extends StatefulWidget {
  const TimePickerBox({Key? key}) : super(key: key);

  @override
  State<TimePickerBox> createState() => _TimePickerBoxState();
}

class _TimePickerBoxState extends State<TimePickerBox> {
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = TimeOfDay.now();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenSize.init(context);
  }

  Future<int?> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showCupertinoModalPopup<TimeOfDay>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: const Color(0xFF313234),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: const Text(
                      'Done',
                      style: TextStyle(color: Color(0xFF007AFF)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(selectedTime);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: ScreenSize.screenHeight * 0.3,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                    selectedTime.hour,
                    selectedTime.minute,
                  ),
                  onDateTimeChanged: (DateTime newDateTime) {
                    setState(() {
                      selectedTime = TimeOfDay(
                        hour: newDateTime.hour,
                        minute: newDateTime.minute,
                      );
                      String formattedTime =
                          '${selectedTime.hour}:${selectedTime.minute}';
                      SharedPreferencesHelper.saveStringData(
                          SharedPrefKeys.hourAndMin.name, formattedTime);
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });

      return picked.hour;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat.Hm().format(
      DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        selectedTime.hour,
        selectedTime.minute,
      ),
    );

    return GestureDetector(
      onTap: () async {
        await _selectTime(context);
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
          formattedTime,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
