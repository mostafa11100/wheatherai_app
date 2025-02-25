import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:wheater_app/core/component/dialog/loading.dart';
import 'package:wheater_app/core/component/toast/toast.dart';
import 'package:wheater_app/core/utilis/app_colors.dart';
import 'package:wheater_app/core/utilis/textstyle_const.dart';
import 'package:wheater_app/futures/home/app_home/presintaion/controller/cubit/get_weather_cubit.dart';
import 'package:wheater_app/futures/home/app_home/presintaion/widgets/half_circle_piechart.dart';
import 'package:wheater_app/futures/home/app_home/presintaion/widgets/line_chart.dart';
import 'package:wheater_app/futures/home/app_home/presintaion/widgets/pie_chart.dart';
import 'package:wheater_app/futures/home/navigation_app_bar/widgets/datepicker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double t = 0;

  int h = 0;

  double v = 0.0;
  double s = 0.0;

  DatePickerController? controler;
  @override
  void initState() {
    controler = DatePickerController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetWeatherCubit, GetWeatherState>(
      listener: (context, state) {
        if (state is GetWeatherLoading) {
          showloadingdialog(context);
        }
        if (state is GetWeatherSuccess) {
          showWeatherToast(state.entity.goout!);
          h = state.entity.humidity;
          t = state.entity.temperature;
          s = state.entity.windSpeed;

          v = state.entity.visibility;
        }
        if (state is GetWeatherFail) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.eror,
                style: TextstyleConst.texts15.copyWith(
                  color: AppColors.colorwhite,
                ),
              ),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      builder: (context, state) {
        return BlocBuilder<GetWeatherCubit, GetWeatherState>(
          builder: (context, state) {
            return SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    //   height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: DateCustomWidget(
                      controller: controler!,
                      onchanged: (datetime) {
                        int days = datetime.day - DateTime.now().day;

                        GetWeatherCubit.blocprovider(
                          context,
                        ).get(days: days == 0 ? 1 : days + 1);
                      },
                    ),
                  ),

                  //SizedBox(height: 5.h),
                  charpie_half(context, t),
                  SizedBox(height: 10.h),
                  piecharts(
                    context,
                    PieChartModel(s, s),
                    PieChartModel(h.toDouble(), h.toDouble()),
                    PieChartModel(v.toDouble(), v.toDouble()),
                  ),
                  SizedBox(height: 20.h),
                  linechart(context),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
