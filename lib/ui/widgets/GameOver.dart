import 'package:flutter/material.dart';
import 'package:sayi_oyunu/utils/TimeConverter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

class GameOver extends StatelessWidget {
  final numberService;
  GameOver({
    @required this.numberService,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 0.25.sw,
        height: 0.25.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[800],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Score: ${timeConverter(time_ago: DateTime.now().difference(numberService.time_ago[0]).inSeconds)}",
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(
                      navigatorKey.currentState.overlay.context,
                    );
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: 80.w,
                    height: 15.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green[800],
                    ),
                    child: Center(
                      child: Text(
                        "Tamam",
                        style: TextStyle(
                          fontSize: 8.sp,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
