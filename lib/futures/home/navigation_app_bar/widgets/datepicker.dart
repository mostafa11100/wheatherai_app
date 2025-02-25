import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wheater_app/core/utilis/textstyle_const.dart';

class DateCustomWidget extends StatefulWidget {
  const DateCustomWidget({
    super.key,
    required this.controller,
    required this.onchanged,
  });
  final DatePickerController controller;
  final Function(DateTime) onchanged;

  @override
  State<DateCustomWidget> createState() => _DateCustomWidgetState();
}

class _DateCustomWidgetState extends State<DateCustomWidget> {
  DateTime? _selectedValue;
  @override
  void initState() {
    _selectedValue = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),

        child: DatePicker(
          controller: widget.controller,
          monthTextStyle: TextstyleConst.texts10.copyWith(),

          //dayTextStyle: TextstyleConst.texts13.copyWith(color: Colors.white),
          DateTime.now(),
          height: 73.h,
          initialSelectedDate: _selectedValue,
          selectionColor: const Color.fromARGB(235, 255, 255, 255),
          deactivatedColor: Colors.white,
          selectedTextColor: Theme.of(context).colorScheme.onSecondary,
          onDateChange: (date) {
            // New date selected
            setState(() {
              _selectedValue = date;
              widget.onchanged(_selectedValue!);
            });
          },
        ),
      ),
    );
  }
}
