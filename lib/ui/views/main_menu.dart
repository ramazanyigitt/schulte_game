import 'package:flutter/material.dart';
import '../../services/game_service.dart';
import 'game_menu.dart';
import '../widgets/category_selector_button.dart';
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
                CategorySelectorButton(
                  categoryName: "Classic Original",
                  routeChild: GameMenu(
                    gameType: GameType.ClassicOriginal,
                  ),
                ),
                CategorySelectorButton(
                  categoryName: "Classic Original Reverse",
                  routeChild: GameMenu(
                    gameType: GameType.ClassicOriginalReverse,
                  ),
                ),
                CategorySelectorButton(
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
                CategorySelectorButton(
                  categoryName: "Classic Light Reverse",
                  routeChild: GameMenu(
                    gameType: GameType.ClassicLightReverse,
                  ),
                ),
                CategorySelectorButton(
                  categoryName: "Reaction",
                  routeChild: GameMenu(
                    gameType: GameType.Reaction,
                  ),
                ),
                CategorySelectorButton(
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
