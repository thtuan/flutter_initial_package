import 'package:flutter/material.dart';

abstract class BasePage {

  Widget Function(BuildContext) get errorWidget => (context) => Container();
}

