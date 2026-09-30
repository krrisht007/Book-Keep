import 'package:flutter/widgets.dart';

import 'gen/app_localizations.dart';

export 'gen/app_localizations.dart';
export '../name_translator.dart' show NameContext, NameTranslator;

extension L10nContext on BuildContext {
  AppLocalizations get t => AppLocalizations.of(this)!;

  String unitName(Object? unit) {
    final u = '$unit';
    switch (u.toLowerCase()) {
      case 'piece':
        return t.unitPiece;
      case 'kg':
        return t.unitKg;
      case 'meter':
        return t.unitMeter;
      case 'box':
        return t.unitBox;
      case 'dozen':
        return t.unitDozen;
      case 'liter':
        return t.unitLiter;
      case 'bag':
        return t.unitBag;
    }
    return u;
  }
}
