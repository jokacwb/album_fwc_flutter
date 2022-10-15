import 'package:flutter/widgets.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0XFF791435);
  Color get secondary => const Color(0XFFFECE50);
  Color get yellow => const Color(0XFFFECE50);
  Color get grey => const Color(0XFFCCCCCC);
  Color get greyDark => const Color(0XFF999999);
}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
