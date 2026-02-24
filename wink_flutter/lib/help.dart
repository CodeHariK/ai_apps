import 'package:flutter/material.dart';
export 'package:flutter/material.dart';

import 'package:wink_flutter/l10n/app_localizations.dart';
export 'package:wink_flutter/l10n/app_localizations.dart';

export 'package:go_router/go_router.dart';

extension WinkBuildContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
