import 'package:flutter/material.dart';
import 'package:sayi_oyunu/main.dart';
import 'package:sayi_oyunu/services/GameService.dart';
import 'package:sayi_oyunu/services/NumberService.dart';
import 'package:sayi_oyunu/ui/widgets/NumberButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayi_oyunu/ui/widgets/ScoreTimer.dart';

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
    numberService.time_ago = [
      DateTime.now(),
    ];
    if (widget.gameType == GameType.ClassicLightReverse ||
        widget.gameType == GameType.ClassicOriginalReverse)
      numberService.selectedNumbers = ValueNotifier([26]);
    else
      numberService.selectedNumbers = ValueNotifier([0]);
    //for (int i = 0; i < 24; i++) numberService.selectedNumbers.add(i);
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
              ScoreTimer(
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
