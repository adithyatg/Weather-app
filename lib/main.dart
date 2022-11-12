import 'package:weatherapp/data_service.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      // home: Demo(),
      initialRoute: '/',
      routes: {
        '/' : (context)=>Demo(),
      },
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse _response=new WeatherResponse(cityName: "",cord: "", tempInfo: new TemperatureInfo(temperature: ""), weatherInfo: new WeatherInfo(description: "", icon: ""));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: SizedBox(
                    width: 350,
                    height: 150,
                    child: TextField(
                        controller: _cityTextController,
                        decoration: InputDecoration(
                            hintText: 'Enter city name whose weather is to be found:',
                            labelText: 'City name'
                        ),
                        textAlign: TextAlign.center),
                  ),
                ),

                ElevatedButton(
                    onPressed: _search,
                    //onPressed: (_response.weatherInfo.description=="Rain" || _response.weatherInfo.description=="Drizzle")? _search:(){},
                    child: Icon(Icons.search_rounded),

                ),
                Column(
                  children: [
                    Text("\n\n\n"),
                    Text("Name of place: "+_response.cityName),
                    Text("Temperature in F: "+_response.tempInfo.temperature),
                    if(_response.weatherInfo.description=="Clouds" || _response.weatherInfo.description=="Haze" ||_response.weatherInfo.description=="Smoke" || _response.weatherInfo.description=="Mist")
                      Text("Weather: "+_response.weatherInfo.description+"\n\n"),
                    if(_response.weatherInfo.description=="Clouds" || _response.weatherInfo.description=="Haze" || _response.weatherInfo.description=="Smoke" || _response.weatherInfo.description=="Mist")
                      new Image.asset(
                        'images/cloudy.jpg',
                        width: 700.0,
                        height: 240.0,
                        fit: BoxFit.fill,
                      ),

                    if(_response.weatherInfo.description=="Sunny" ||_response.weatherInfo.description=="Clear")
                      Text("Weather: "+_response.weatherInfo.description+"\n\n"),
                    if(_response.weatherInfo.description=="Sunny" ||_response.weatherInfo.description=="Clear")
                      new Image.asset(
                        'images/Sunny.jpeg',
                        width: 700.0,
                        height: 240.0,
                        fit: BoxFit.fill,
                      ),
                    if(_response.weatherInfo.description=="Rain" || _response.weatherInfo.description=="Drizzle" || _response.weatherInfo.description=="Thunderstorm")
                      Text("Weather: "+_response.weatherInfo.description+"\n\n"),
                    if(_response.weatherInfo.description=="Rain" || _response.weatherInfo.description=="Drizzle" || _response.weatherInfo.description=="Thunderstorm")
                      new Image.asset(
                        'images/rainy.jpg',
                        width: 700.0,
                        height: 240.0,
                        fit: BoxFit.fill,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}

