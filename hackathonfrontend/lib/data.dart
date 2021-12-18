import 'Entity/User.dart';

const String localhost = "http://192.168.254.10:8000";

List<String> svgImages = ["assets/flood.svg","assets/bi_tornado.svg",];
List<String> weekdays = ["SUN","MON","TUE","WED","THU","FRI","SAT"];
User? meUser;

String authKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJ3ZWJwazE0NEBnbWFpbC5jb20iLCJhcGlfdG9rZW4iOiI2ODNHNllUX1lmRWJEa09NZFVVNTVzaVE0eWpMYy15YTUzeE1XR2dHRkNGTXpwQnRkbURXRTNHdE82SmozTndOY29VIn0sImV4cCI6MTYzOTkxOTYxMX0.e7yvnuKf-VtfMfy8XjjXmJNeDVU5QAZ0nIOaM7PYI2s";