import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_finder/models/models.dart';
import 'package:food_finder/services/place_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'package:food_finder/constants.dart';

class LoadingScreen extends StatefulWidget {
  static const String id = 'loading_screen';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  PlaceService _placeService;
  Position _currentPosition;

  @override
  void initState() {
    super.initState();
    _placeService = PlaceService();
    _getCurrentLocation();
  }

  Future<dynamic> _getCurrentLocation() async {
    await geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      // _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
              future:
                  // _placeService.getPlaces(lat: "9.6062091", long: "6.5297235"),
                  _placeService.getPlaces(
                lat: _currentPosition != null
                    ? _currentPosition.latitude.toString()
                    : 'Waiting Latitude',
                long: _currentPosition != null
                    ? _currentPosition.longitude.toString()
                    : 'Waiting Longitude',
              ),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? PlaceList(result: snapshot.data)
                    : Center(
                        child: SpinKitFoldingCube(
                          color: kPrimaryColor,
                          size: 100.0,
                        ),
                      );
              }),
        ),
      ),
    );
  }
}

class PlaceList extends StatefulWidget {
  final List<Result> result;

  PlaceList({Key key, this.result}) : super(key: key);

  @override
  _PlaceListState createState() => _PlaceListState();
}

class _PlaceListState extends State<PlaceList> {
  final String icon =
      'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.result.length,
        itemBuilder: (BuildContext context, int index) {
          final result = widget.result[index];
          return PlaceCard(
            name: result.name,
            rating: result.rating,
            icon: icon,
          );
        });
  }
}

class PlaceCard extends StatelessWidget {
  final String name;
  final String icon;
  final String rating;
  final bool openNow;

  PlaceCard({Key key, this.name, this.icon, this.rating, this.openNow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryColor,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              icon,
              color: Colors.white,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  SmoothStarRating(
                    allowHalfRating: false,
                    onRated: (v) {},
                    starCount: 5,
                    rating: double.parse(rating),
                    size: 20.0,
                    isReadOnly: true,
                    color: Colors.white,
                    borderColor: Colors.white,
                    spacing: 0.0,
                  ),
                  Text(
                    'Rating Star: $rating',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
