import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromRGBO(79, 79, 158, 1);
const kPrimaryLightColor = Color(0xffffecdf);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color.fromRGBO(79, 79, 128, 1),
    Color.fromRGBO(79, 79, 158, 1),
  ],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

const apiKey = 'AIzaSyCEmwxmlguTjbKuhVJRdTHyyl02es2S8J4';
const BASE_URL =
    'https://maps.googleapis.com/maps/api/place/nearbysearch/json?';

const kRadius = 1500;
const kType = "restaurant";
const kKeyword = "food";