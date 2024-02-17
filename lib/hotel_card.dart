import 'package:flutter/material.dart';
import 'package:layla_assignment/hotel_data.dart';
import 'package:layla_assignment/video_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HotelCard extends StatefulWidget {
  final HotelData hotel;
  const HotelCard({Key? key, required this.hotel}) : super(key: key);

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  int currentIndex = 0;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //short video Widget...
          Stack(
            children: [
              //Container hold the Short Video
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 348,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: PageView.builder(
                    itemCount: widget.hotel.videoUrls.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex =
                            index; // Update currentIndex when page changes
                      });
                    },
                    itemBuilder: (_, i) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: VideoPlayerWidget(
                            videoUrl: widget.hotel.videoUrls[i]),
                      );
                    },
                  ),
                ),
              ),
              //Top label and Favorite....
              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.hotel.label.isNotEmpty
                        ? Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              widget.hotel.label,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : Container(),
                    GestureDetector(
                      // Wrap Icon with GestureDetector
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite; // Toggle favorite state
                        });
                      },
                      child: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons
                                .favorite_border, // Change icon based on favorite state
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              // Black Dots
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.hotel.videoUrls.length,
                    (index) => Container(
                      height: 8,
                      width: 8,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: index == currentIndex
                            ? Colors.white
                            : const Color.fromARGB(255, 147, 146, 146),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          //Hotel detail like Name ,Rating,Pricing etc....
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hotel Name',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.hotel.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8C9094),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                      color: Colors.blue[900],
                    ),
                    child: Text(
                      widget.hotel.rating.toString(),
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'Very Good (213 reviews)',
                    style: TextStyle(
                        color: Color(0xff8C9094),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                    Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color.fromRGBO(80, 176, 58, 0.2),
                    ),
                    child: const Text(
                      'Breakfast Included',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(80, 176, 58, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                 ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '\$ ${widget.hotel.pricePerNight.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const TextSpan(
                          text: ' night',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '\$ ${widget.hotel.priceFor3Nights.toStringAsFixed(0)} (3 nights)',
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xff8C9094),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
