import 'package:flutter/material.dart';
import 'package:sayi_oyunu/services/GameService.dart';
import 'package:sayi_oyunu/ui/views/GameMenu.dart';
import 'package:sayi_oyunu/ui/widgets/CategorySelector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(411.4, 762),
      allowFontScaling: true,
    );
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategorySelector(
                  categoryName: "Classic Original",
                  routeChild: GameMenu(
                    gameType: GameType.ClassicOriginal,
                  ),
                ),
                CategorySelector(
                  categoryName: "Classic Original Reverse",
                  routeChild: GameMenu(
                    gameType: GameType.ClassicOriginalReverse,
                  ),
                ),
                CategorySelector(
                  categoryName: "Classic Light",
                  routeChild: GameMenu(
                    gameType: GameType.ClassicLight,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.10.sh,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategorySelector(
                  categoryName: "Classic Light Reverse",
                  routeChild: GameMenu(
                    gameType: GameType.ClassicLightReverse,
                  ),
                ),
                CategorySelector(
                  categoryName: "Reaction",
                  routeChild: GameMenu(
                    gameType: GameType.Reaction,
                  ),
                ),
                CategorySelector(
                  categoryName: "Memory",
                  routeChild: GameMenu(
                    gameType: GameType.Memory,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
