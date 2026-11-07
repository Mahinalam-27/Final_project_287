
import 'package:final_project_287_g/auth/authgate.dart';
import 'package:final_project_287_g/home_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url:'https://ypafpxwaeyulubanggpe.supabase.co' ,
    publishableKey: 'sb_publishable_55spvMA147P-fmqHrO1bxg_6EFgHKKI',
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Authgate(),
    );
  }
}
