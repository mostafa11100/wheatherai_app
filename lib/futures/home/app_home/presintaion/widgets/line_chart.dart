import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget linechart(context) {
  return Container(
    padding: EdgeInsets.all(15.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.r),
      color: Theme.of(context).colorScheme.onPrimary,
    ),
    width: 350.w,
    height: MediaQuery.of(context).size.height / 5,
    child: LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          show: true,
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ), // إخفاء الأرقام على اليسار
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ), // إخفاء الأرقام أسفل الشارت
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ), // إخفاء الأرقام على اليمين
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ), // إخفاء الأرقام في الأعلى
        ),
        gridData: FlGridData(show: true),

        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 5), // الساعة 0، سرعة الرياح 5 م/ث
              FlSpot(1, 10), // الساعة 1، سرعة الرياح 10 م/ث
              FlSpot(2, 7),
              FlSpot(3, 12),
              FlSpot(4, 8),
              FlSpot(5, 15), // الساعة 5، سرعة الرياح 15 م/ث
            ],
            isCurved: true, // لجعل الخط متعرج (منحني)

            dotData: FlDotData(show: false), // عرض النقاط
            belowBarData: BarAreaData(show: true),
          ),
        ],
      ),
    ),
  );
}
