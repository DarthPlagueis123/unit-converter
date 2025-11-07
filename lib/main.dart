import 'package:flutter/material.dart';
import 'screens/converter_home.dart';

void main() {
  runApp(const UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',

      // -----------------------------------------------------
      //  THEME + SOFT SKY BLUE APP BAR
      // -----------------------------------------------------
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.lightBlue,
        
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.lightBlue.shade300,  // ✅ Soft sky blue
          foregroundColor: Colors.white,               // ✅ White text/icons
          elevation: 3,
          scrolledUnderElevation: 0,
        ),
      ),

      home: const AppBackground(
        child: ConverterHome(),
      ),
    );
  }
}

/// -----------------------------------------------------------
/// Background gradient wrapper
/// Applies a smooth blue-toned sky gradient behind the whole app.
/// -----------------------------------------------------------
class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Sky blue gradient background
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlue.shade50,   // soft near white
            Colors.lightBlue.shade100,  // gentle blue
            Colors.lightBlue.shade200,  // slightly stronger blue
          ],
        ),
      ),
      child: child,
    );
  }
}
