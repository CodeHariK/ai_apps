import 'package:moonspace/electrify.dart';
import 'package:wink_flutter/help.dart';
import 'package:wink_flutter/Providers/router.dart';

void main() {
  electrify(
    title: "Home",
    before: (widgetsBinding) {},
    after: () {},
    wrap: (context, child) {
      return child ?? Text("Error");
    },
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    themes: [],
    router: winkRouter,
    init: (c) async {
      c.listen(routerRedirectorProvider, (prev, next) {});
    },
    recordFlutterFatalError: (details) {},
    recordError: (error, stack) {},
    debugUi: false,
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(child: Text(context.l10n.helloWorld));
  }
}
