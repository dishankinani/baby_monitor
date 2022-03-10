// class DHT {
//   final double temp;
//
//   DHT({required this.temp});
//
//   factory DHT.fromJson(Map<dynamic, dynamic> json) {
//     double parser(dynamic source) {
//       try {
//         return double.parse(source.toString());
//       } on FormatException {
//         return -1;
//       }
//     }
//
//     return DHT(
//         temp: parser(json['temp']);
//   }
// }
