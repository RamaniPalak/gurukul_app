import 'package:flutter/material.dart';
import 'package:gurukul_app/app.dart';
import 'package:gurukul_app/providers_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(RestartWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return multiProvider();
  }
}

Widget multiProvider(){
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => authProvider),
      ChangeNotifierProvider(create: (_) => homeProvider),
      ChangeNotifierProvider(create: (_) => profileProvider),
      ChangeNotifierProvider(create: (_) => serviceProvider),
    ],
    child: app(),
  );
}

class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});

  final Widget? child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child ?? Container(),
    );
  }
}