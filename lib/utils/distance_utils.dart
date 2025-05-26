/// [FxDistanceUtils] - gives different functions that can be used for calculating or formatting distance
library;


import 'dart:math';

class FxLatLng {

  FxLatLng(this.latitude, this.longitude);
  final double latitude, longitude;
}

class FxDistanceUtils {
  static String formatDistance(double distance) {
    if (distance > 1000) {
      distance = distance / 1000;
      return '${(distance).toStringAsFixed(
              distance.truncateToDouble() == distance ? 0 : 2)} KM';
    } else {
      return '${distance.floor()} Meter';
    }
  }

  static double calculateDistance(lat1, lon1, lat2, lon2) {
    final p = 0.017453292519943295;
    final c = cos as double Function(num?);
    final a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * 1000 * asin(sqrt(a));
  }

  static double calculateDistanceBetweenTwoLtnLng(
      FxLatLng origin, FxLatLng destination) {
    final double lat1 = origin.latitude;
    final double lon1 = origin.longitude;
    final double lat2 = destination.latitude;
    final double lon2 = destination.longitude;
    final p = 0.017453292519943295;
    final c = cos;
    final a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}
