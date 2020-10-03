import 'package:flutter/material.dart';
import 'package:food_finder/constants.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Restaurant extends StatelessWidget {
  static const String id = 'view_restaurant';

  final String name;
  final String icon;
  final String rating;
  final String vicinity;

  const Restaurant({
    Key key,
    this.vicinity,
    @required this.name,
    this.icon,
    @required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                icon,
                color: kPrimaryColor,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: FittedBox(
                        child: Text(
                          name.toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: 'Address: ',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: '$vicinity' ?? '',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    SmoothStarRating(
                      allowHalfRating: false,
                      onRated: (v) {},
                      starCount: 5,
                      rating: double.parse(rating),
                      size: 40.0,
                      isReadOnly: true,
                      color: kPrimaryColor,
                      borderColor: kPrimaryColor,
                      spacing: 0.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
