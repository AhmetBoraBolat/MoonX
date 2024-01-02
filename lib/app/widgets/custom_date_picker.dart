import 'package:flutter/material.dart';
import 'package:moon_x/app/components/helper/screen_size.dart';

class DatePickerBox extends StatefulWidget {
  const DatePickerBox({Key? key}) : super(key: key);

  @override
  State<DatePickerBox> createState() => _DatePickerBoxState();
}

class _DatePickerBoxState extends State<DatePickerBox> {
  DateTime selectedDate = DateTime.now();

  Future<int?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      return DateTime.now().year - picked.year;
    }
    return null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenSize.init(context);
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = selectedDate != null
        ? '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'
        : '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';

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
