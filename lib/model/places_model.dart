import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final String name;
  final LatLng latLng;
  final String id;

  PlaceModel({
    required this.name,
    required this.latLng,
    required this.id,
  });
}

List<PlaceModel> places = [
  PlaceModel(
    name: 'جامعة الزقازيق',
    latLng: const LatLng(30.588606188062347, 31.483224798185052),
    id: '1',
  ),
  PlaceModel(
    name: 'نادي أحمد عرابي للقوات المسلحه',
    latLng: const LatLng(30.583239051364778, 31.485935481153014),
    id: '2',
  ),
  PlaceModel(
    name: 'بيتزا إسكندرية',
    latLng: const LatLng(30.589661311677222, 31.491885997770535),
    id: '3',
  ),
  PlaceModel(
    name: 'حديقة الحيوان بالزقازيق',
    latLng: const LatLng(30.58832819753215, 31.495370394167395),
    id: '4',
  ),
];
