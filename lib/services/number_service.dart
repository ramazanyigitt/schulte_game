import 'package:flutter/foundation.dart';

import 'game_service.dart';

class NumberService {
  List<int> randomNumbers;
  ValueNotifier<List<int>> selectedNumbers;
  List<DateTime> timeAgo;

  List<int> createRandomNumbers() {
    randomNumbers = [];
    for (int i = 1; i <= 25; i++) {
      randomNumbers.add(i);
    }
    randomNumbers.shuffle();
    return randomNumbers;
  }

  bool controlNumber({int number}) {
    if (selectedNumbers.value.last + 1 == number) {
      selectedNumbers.value = List.from(selectedNumbers.value)..add(number);
      return true;
    }
    return false;
  }

  bool controlNumberReverse({int number}) {
    if (selectedNumbers.value.last - 1 == number) {
      selectedNumbers.value = List.from(selectedNumbers.value)..add(number);
      return true;
    }
    return false;
  }

  Function numberSelectEvent({GameType gameType}) {
    if (gameType == GameType.ClassicOriginal ||
        gameType == GameType.ClassicLight ||
        gameType == GameType.Reaction ||
        gameType == GameType.Memory) {
      return controlNumber;
    } else {
      return controlNumberReverse;
    }
  }
}
