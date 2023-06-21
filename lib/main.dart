import 'package:coffee_shop/data/expense_data.dart';
import 'package:coffee_shop/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'models/coffee_shop.dart';


void main() async {

  //initialize hive
  await Hive.initFlutter();

  //open a hive box
  await Hive.openBox("expense_database");

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider (
      providers: [
        ChangeNotifierProvider(create: (context) => CoffeeShop(),
        ),
      ChangeNotifierProvider(create: (context) => ExpenseData(),
        builder: (context,child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AuthPage(),
        ),
      )
    ],
    );
  }
}








