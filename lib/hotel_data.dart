class HotelData {
  final String name;
  final String label;
  final double rating;
  final double pricePerNight;
  final double priceFor3Nights;
  final List<String> offers;
  final List<String> videoUrls;

  HotelData({
    required this.name,
    required this.label,
    required this.rating,
    required this.pricePerNight,
    required this.priceFor3Nights,
    required this.offers,
    required this.videoUrls,
  });
}

List<HotelData> hotelList = [
  HotelData(
    name: 'Charlottenburg, Berlin',
    label: '',
    offers: ['Breakfast Included'],
    rating: 8.2,
    pricePerNight: 123.0,
    priceFor3Nights: 900.0,
    videoUrls: [
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
    ],
  ),
  HotelData(
    name: 'Hotel Adlon Kempinski Berlin',
    label: 'Example Text',
    offers: [],
    rating: 7.5,
    pricePerNight: 150.0,
    priceFor3Nights: 1000.0,
    videoUrls: [
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
    ],
  ),
  HotelData(
    name: 'Waldorf Astoria Berlin',
    label: 'Example Text',
    offers: ['Breakfast Included','Dinner Included'],
    rating: 9.0,
    pricePerNight: 200.0,
    priceFor3Nights: 1500.0,
    videoUrls: [
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    ],
  ),
];
