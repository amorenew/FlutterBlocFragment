import 'package:flutter/material.dart';

abstract class Fragment extends Widget{
  String getRouteName();
  String getTitle();
}