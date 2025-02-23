class ModelGetwheather {
  String? location;
  String? language;
  int? days;
  bool? aqi;
  bool? alerts;
  Map<String, dynamic> json = {};
  ModelGetwheather({
    this.location,
    this.alerts,
    this.aqi,
    this.days,
    this.language,
  });
  Map<String, dynamic> tojson() {
    location != null ? json['q'] = location : null;

    language != null ? json['lang'] = language : null;

    days != null ? json['days'] = days : null;

    aqi != null ? json['aqi'] = aqi : null;

    alerts != null ? json['alerts'] = alerts : null;
    return json;
  }
}
