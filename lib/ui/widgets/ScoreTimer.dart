import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sayi_oyunu/services/NumberService.dart';
import 'package:sayi_oyunu/utils/TimeConverter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScoreTimer extends StatefulWidget {
  final NumberService numberService;
  const ScoreTimer({
    @required this.numberService,
  });

  @override
  _ScoreTimerState createState() => _ScoreTimerState();
}

class _ScoreTimerState extends State<ScoreTimer> {
  @override
  initState() {
    super.initState();
    updater();
  }

  updater() async {
    await Future.delayed(Duration(milliseconds: 16));
    if (mounted) setState(() {});
    updater();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Score: ${timeConverter(time_ago: DateTime.now().difference(widget.numberService.time_ago[0]).inSeconds)}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 9.sp,
          ),
        ),
      ),
    );
  }
}
