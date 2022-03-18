import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/score_timer_box.dart';

import '../../main.dart';
import '../../services/game_service.dart';
import '../../services/number_service.dart';
import '../widgets/number_button.dart';

class GameMenu extends StatefulWidget {
  final GameType gameType;
  const GameMenu({
    @required this.gameType,
  });

  @override
  _GameMenuState createState() => _GameMenuState();
}

class _GameMenuState extends State<GameMenu>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  NumberService numberService;

  @override
  void initState() {
    numberService = new NumberService()..createRandomNumbers();
    numberService.timeAgo = [
      DateTime.now(),
    ];
    if (widget.gameType == GameType.ClassicLightReverse ||
        widget.gameType == GameType.ClassicOriginalReverse)
      numberService.selectedNumbers = ValueNotifier([26]);
    else
      numberService.selectedNumbers = ValueNotifier([0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(navigatorKey.currentState.overlay.context);
                },
                child: Container(
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      size: 22.w,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 25.w,
              ),
              ScoreTimerBox(
                numberService: numberService,
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: 1.sw,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: GridView.builder(
                itemCount: 25,
                itemBuilder: (context, index) {
                  return NumberButton(
                    number: numberService.randomNumbers[index],
                    onClick: numberService.numberSelectEvent(
                      gameType: widget.gameType,
                    ),
                    gameType: widget.gameType,
                    numberService: numberService,
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2.5,
                  crossAxisCount: 5,
                  crossAxisSpacing: 2.w,
                  mainAxisSpacing: 2.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
