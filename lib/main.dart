import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:gold_seeker/features/features_intro/feature_splash/presentation/screens/splash_screen.dart';
import 'features/features_intro/feature_splash/presentation/bloc/splash_cubit/splash_cubit.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> SplashCubit()),
      ], child: const MyApp()));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
