import 'package:flutter/material.dart';


double getHigh(Size size) {
  return (size.width > 600) ? size.height * 0.6 : size.height / 3;
}

double getWidth(Size size) {
  return (size.width > 600) ? size.width * 0.6 : size.width * 0.8;
}

double getBoxHigh(Size size) {
  return (size.width < 600) ? size.height * 0.2 : 20;
}

String getDevice(Size size) {
  return size.width < 800 ? "mobile" : "tablet";
}

bool  isTablet(value)=> value>=800 ? true: false;
bool  isLargeScreen(value)=> value>=600 ? true: false;
