class City {
  final String countryCode;
  final String city;

  City({
    required this.city,
    required this.countryCode,
  });
}

List<City> cities = [
  City(city: 'Kabul', countryCode: 'af'), 
  City(city: 'London', countryCode: 'uk'), 
  City(city: 'California', countryCode: 'us'), 
];