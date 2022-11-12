class WeatherInfo {
   String description="";
   String icon="";

  WeatherInfo({required this.description,required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['main'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class TemperatureInfo {
   String temperature="";

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = (json['temp'].toString());
    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherResponse {
   String cityName="";
   String cord="";
   TemperatureInfo tempInfo;
   WeatherInfo weatherInfo;

  WeatherResponse({required this.cityName,required this.cord,required this.tempInfo,required this.weatherInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final cord=json['coord'].toString();

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponse(cityName: cityName,cord: cord, tempInfo: tempInfo, weatherInfo: weatherInfo);
  }
}