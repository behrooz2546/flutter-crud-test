import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Application {
  static late FluroRouter router;

  static backTo(BuildContext context, String route) {
    Navigator.of(context).popUntil(
      ModalRoute.withName(route),
    );
  }
}
