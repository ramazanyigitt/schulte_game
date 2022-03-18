import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ui/views/MainMenu.dart';

void main() {
  runApp(NumberGame());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class NumberGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainMenu(),
        navigatorKey: navigatorKey,
      ),
    );
  }
}
