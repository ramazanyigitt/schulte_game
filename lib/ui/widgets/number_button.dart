import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../main.dart';
import '../../services/game_service.dart';
import '../../services/number_service.dart';
import 'game_over_box.dart';

class NumberButton extends StatefulWidget {
  final int number;
  final Function onClick;
  final NumberService numberService;
  final GameType gameType;

  NumberButton({
    @required this.number,
    @required this.onClick,
    @required this.numberService,
    @required this.gameType,
  });

  @override
  _NumberButtonState createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  bool selected, animate, inReaction;
  double x, y, centerY, centerX;
  ValueNotifier<double> showMemory;
  Timer t;
  final secondToMil = (1000 / 16);

  @override
  void initState() {
    selected = false;
    animate = false;
    inReaction = false;
    centerY = 1.sh - 0.30.sh;
    centerX = 0.30.sw;
    if (widget.gameType == GameType.Memory) {
      showMemory = ValueNotifier(3 * secondToMil);
      memoryTimer();
    }
    super.initState();
  }

  memoryTimer() {
    t = new Timer.periodic(Duration(milliseconds: 16), (_) {
      if (showMemory.value < 0) return;
      showMemory.value -= 1;
    });
  }

  @override
  void dispose() {
    super.dispose();
    t?.cancel();
  }

  _clickEvent() {
    if (widget.onClick(number: widget.number)) {
      if (widget.gameType != GameType.ClassicOriginal &&
          widget.gameType != GameType.ClassicOriginalReverse) {
        animate = true;
        RenderBox box = context.findRenderObject();
        Offset position = box.localToGlobal(Offset.zero);
        x = position.dx;
        y = position.dy;

        x = centerX - x + (x / 4);

        y = centerY - y + (y / 4);
      }
      setState(() {
        selected = true;
      });
      if (widget.numberService.selectedNumbers.value.length == 26) {
        Navigator.pop(
          navigatorKey.currentState.overlay.context,
        );
        showDialog(
          context: navigatorKey.currentState.overlay.context,
          useRootNavigator: false,
          barrierDismissible: true,
          builder: (context) => GameOverBox(
            numberService: widget.numberService,
          ),
        );
      }
    } else if (widget.gameType == GameType.Memory) {
      showMemory.value = 3 * secondToMil;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: widget.gameType == GameType.Reaction
          ? inReaction
              ? Colors.grey[600].withOpacity(0.75)
              : Colors.transparent
          : widget.gameType == GameType.Memory
              ? Colors.transparent
              : Colors.grey[600].withOpacity(0.75),
      onTap: () {
        if (widget.gameType == GameType.Reaction && inReaction)
          setState(() {
            inReaction = false;
          });
        _clickEvent();
      },
      child: animate
          ? TweenAnimationBuilder(
              key: UniqueKey(),
              tween: Tween<double>(begin: 1, end: -0.25),
              duration: Duration(milliseconds: 600),
              builder: (BuildContext context, double s, Widget child) {
                return Transform.translate(
                  offset: Offset(x, y),
                  child: Transform.rotate(
                    angle: -pi,
                    child: Transform.scale(
                      scale: s,
                      origin: Offset(0, 0),
                      child: Container(
                        color:
                            selected ? Colors.green[800] : Colors.transparent,
                        child: Center(
                          child: Text(
                            "${widget.number}",
                            style: TextStyle(
                              fontSize: 8.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              onEnd: () {
                animate = false;
              },
              curve: Curves.linearToEaseOut,
            )
          : widget.gameType == GameType.Reaction
              ? ReactionNumber(
                  numberState: this,
                )
              : widget.gameType == GameType.Memory
                  ? MemoryNumber(
                      numberState: this,
                    )
                  : Container(
                      color: selected ? Colors.green[800] : Colors.transparent,
                      child: Center(
                        child: Text(
                          "${widget.number}",
                          style: TextStyle(
                            fontSize: 8.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
    );
  }
}

class ReactionNumber extends StatelessWidget {
  final _NumberButtonState numberState;
  ReactionNumber({
    @required this.numberState,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: numberState.widget.numberService.selectedNumbers,
      builder: (context, value, child) {
        numberState.inReaction = numberState.widget.number == value.last + 1;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          numberState.setState(() {});
        });
        return numberState.inReaction
            ? Container(
                color: numberState.selected
                    ? Colors.green[800]
                    : Colors.transparent,
                child: Center(
                  child: Text(
                    "${numberState.widget.number}",
                    style: TextStyle(
                      fontSize: 8.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : Container();
      },
    );
  }
}

class MemoryNumber extends StatelessWidget {
  final _NumberButtonState numberState;
  MemoryNumber({
    @required this.numberState,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: numberState.showMemory,
      builder: (context, value, child) {
        return value > 0
            ? child
            : Container(
                color: Colors.grey[700],
              );
      },
      child: Container(
        color: numberState.selected ? Colors.green[800] : Colors.grey[700],
        child: Center(
          child: Text(
            "${numberState.widget.number}",
            style: TextStyle(
              fontSize: 8.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
