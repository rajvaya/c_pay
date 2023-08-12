enum UpiKeyboardKey {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  back,
  zero,
  done
}

extension UpiKeyboardKeyExtension on UpiKeyboardKey {
  String get numberAsString {
    switch (this) {
      case UpiKeyboardKey.one:
        return '1';
      case UpiKeyboardKey.two:
        return '2';
      case UpiKeyboardKey.three:
        return '3';
      case UpiKeyboardKey.four:
        return '4';
      case UpiKeyboardKey.five:
        return '5';
      case UpiKeyboardKey.six:
        return '6';
      case UpiKeyboardKey.seven:
        return '7';
      case UpiKeyboardKey.eight:
        return '8';
      case UpiKeyboardKey.nine:
        return '9';
      case UpiKeyboardKey.zero:
        return '0';
      case UpiKeyboardKey.back:
        return 'back';
      case UpiKeyboardKey.done:
        return 'done';
      default:
        return '';
    }
  }
}
