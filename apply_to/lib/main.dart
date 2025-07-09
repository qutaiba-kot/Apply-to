import 'package:apply_to/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(448, 997),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.light.copyWith(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.white,
            selectionColor: Colors.white.withOpacity(0.3),
            selectionHandleColor: Colors.white,
          ),
        ),
        darkTheme: AppTheme.dark.copyWith(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.black,
            selectionColor: Colors.black.withOpacity(0.3),
            selectionHandleColor: Colors.black,
          ),
        ),
        themeMode: ThemeMode.system,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(color: Theme.of(context).colorScheme.primary , fontSize: 20.w) ,
              
            ),
            Text(
              '$_counter',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add, size: 20.w),
      ),
    );
  }
}
