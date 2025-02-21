import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:wheater_app/core/utilis/textstyle_const.dart';

Widget piechartcustom(context, PieChartModel pie, text) {
  return Column(
    children: [
      PieChart(
        dataMap: {"0": pie.value, "1": 100 - pie.value},
        animationDuration: Duration(milliseconds: 800),
        chartLegendSpacing: 0,
        chartRadius: 55.r,
        colorList: [
          Theme.of(context).colorScheme.secondary,

          Theme.of(context).colorScheme.onPrimary,
        ],
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth: 5,
        centerText: ("${pie.center.toInt().toString()}%"),
        legendOptions: LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.right,
          showLegends: false,
          legendShape: BoxShape.circle,
          // legendTextStyle: TextstyleConst.texts13,
        ),
        chartValuesOptions: ChartValuesOptions(
          showChartValueBackground: false,
          chartValueStyle: TextstyleConst.texts18,
          showChartValues: false,
          showChartValuesInPercentage: false,
          showChartValuesOutside: false,
          decimalPlaces: 1,
        ),
        // gradientList: ---To add gradient colors---
        // emptyColorGradient: ---Empty Color gradient---
      ),
      SizedBox(height: 5.h),
      Text(text, style: TextstyleConst.texts13),
    ],
  );
}

Widget piecharts(
  context,
  PieChartModel pie1,
  PieChartModel pie2,
  PieChartModel pie3,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 40.w,
    children: [
      piechartcustom(context, pie1, "Speed"),
      piechartcustom(context, pie2, "Humidity"),
      piechartcustom(context, pie3, "Visibility"),
    ],
  );
}

class PieChartModel {
  double center;
  double value;
  PieChartModel(this.center, this.value);
}
