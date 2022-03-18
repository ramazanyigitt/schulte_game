import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../services/number_service.dart';
import '../../utils/time_converter.dart';

class ScoreTimerBox extends StatefulWidget {
  final NumberService numberService;
  const ScoreTimerBox({
    @required this.numberService,
  });

  @override
  _ScoreTimerBoxState createState() => _ScoreTimerBoxState();
}

class _ScoreTimerBoxState extends State<ScoreTimerBox> {
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
          "Score: ${timeConverter(time_ago: DateTime.now().difference(widget.numberService.timeAgo[0]).inSeconds)}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 9.sp,
          ),
        ),
      ),
    );
  }
}
