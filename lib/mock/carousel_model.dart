
import 'package:aunjai/model/carousel_model.dart';

List<CarouselModel> carousels =
    carouselsData.map((item) => CarouselModel(image: item['image']!)).toList();

var carouselsData = [
  {"image": "assets/promotion/carousel_flight_discount.png"},
  {"image": "assets/promotion/carousel_hotel_discount.png"},
  {"image": "assets/promotion/carousel_covid_discount.png"},
];
