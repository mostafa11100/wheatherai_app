import 'package:equatable/equatable.dart';

class GetCurrentEntity extends Equatable {
  final String cityName;
  final double temperature;
  final String conditionText;
  final String conditionIcon;
  final double windSpeed;
  final int humidity;
  final int cloudiness;
  final double visibility;
  final String lastUpdated;

  GetCurrentEntity({
    required this.cityName,
    required this.temperature,
    required this.conditionText,
    required this.conditionIcon,
    required this.windSpeed,
    required this.humidity,
    required this.cloudiness,
    required this.visibility,
    required this.lastUpdated,
  });

  @override
  List<Object?> get props => [
    cityName,
    conditionIcon,
    conditionText,
    temperature,
    windSpeed,
    humidity,
    cloudiness,
    visibility,
    lastUpdated,
  ];
}
