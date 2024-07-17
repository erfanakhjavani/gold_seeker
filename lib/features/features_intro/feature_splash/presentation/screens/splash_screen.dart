import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as Tra;
import 'package:get/get.dart';
import 'package:gold_seeker/features/features_intro/feature_login/screens/login_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../bloc/splash_cubit/splash_cubit.dart';



class SplashScreen extends StatefulWidget {
  static const routeName = "/splash_screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //goToHome();


    BlocProvider.of<SplashCubit>(context).checkConnectionEvent();
  }



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.black,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.jpg',
                width: width * 0.8,
              ),
               const SizedBox(height: 15
                ,),



              BlocConsumer<SplashCubit, SplashState>(
                  builder: (context, state){
                    /// if user is online
                    if(state.connectionStatus is ConnectionInitial || state.connectionStatus is ConnectionOn){
                      return Directionality(
                        textDirection: TextDirection.ltr,
                        child: LoadingAnimationWidget.stretchedDots(
                          color: Colors.white,
                          size: 40,
                        ),
                      );
                    }

                    /// if user is offline
                    if(state.connectionStatus is ConnectionOff){
                      return DelayedWidget(
                          delayDuration: const Duration(milliseconds: 200),
                          animationDuration: const Duration(milliseconds: 1000),
                          animation: DelayedAnimations.SLIDE_FROM_TOP,
                          child: Column(
                          children: [

                            const Text("Please check your connection!",style: TextStyle(
                                fontSize: 22,color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),),
                            const SizedBox(height: 10,),
                            IconButton(
                                splashColor: Colors.white,
                                onPressed: (){
                                  /// check that we are online or not
                                  BlocProvider.of<SplashCubit>(context).checkConnectionEvent();
                                },
                                icon: const Icon(Icons.autorenew, color: Colors.white,)),
                            const Text('Retry', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Irs"),),
                          ],
                        ),
                      );
                    }

                    /// default value
                    return Container();

                  },
                  listener: (context, state){
                    if(state.connectionStatus is ConnectionOn){
                      gotoHome();
                    }
                  }
              ),
              const SizedBox(height: 30,),

            ],
          ),
      ),
    );
  }

  Future<void> gotoHome() {
    return Future.delayed(const Duration(seconds: 3), () {
      Navigator.canPop(context);
      Get.to(LoginScreen(),transition: Tra.Transition.native);

    });
  }
}




