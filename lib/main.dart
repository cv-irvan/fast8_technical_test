import 'package:fast8_technical_test/controller/produk_controller.dart';
import 'package:fast8_technical_test/controller/profile_controller.dart';
import 'package:fast8_technical_test/screen/home_screen.dart';
import 'package:fast8_technical_test/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'controller/home_controller.dart';
import 'controller/image_picker_controller.dart';
import 'utils/theme_data_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('productsBox');
  await Hive.openBox('profileBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeController()),
        ChangeNotifierProvider(create: (context) => ProductController()),
        ChangeNotifierProvider(create: (context) => ProfileController()),
        ChangeNotifierProvider(create: (context) => ImagePickerController()),
      ],
      child: MaterialApp(
        title: 'Fast8 Technical Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorApp.primary),
          scaffoldBackgroundColor: ColorApp.white,
          textTheme: ThemeDataApp().textTheme,
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
