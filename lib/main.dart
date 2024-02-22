
import 'package:cloudapp/Controller/clsCategoryController.dart';
import 'package:cloudapp/Controller/clsContactContoller.dart';
import 'package:cloudapp/Controller/clsLocalizationContoller.dart';
import 'package:cloudapp/Controller/clsProfileContoller.dart';
import 'package:cloudapp/Helper/clsColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloudapp/Controller/clsAuthController.dart';
import 'package:cloudapp/Controller/clsOnBoardingController.dart';
import 'package:cloudapp/View/Pages/Auth/clsRigisterScrean.dart';
import 'Controller/clsCarsuolController.dart';
import 'Controller/clsStateController.dart';
import 'View/Pages/OnBoard/clsOnBoardScrean.dart';
import 'package:cloudapp/Helper/clsShardName.dart';
import 'package:cloudapp/Util/clsShardPrefHelper.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<clsOnBoardingController>(create: (_)=>clsOnBoardingController())
        ,ChangeNotifierProvider<clsAuthController>(create: (_)=>clsAuthController())
        ,ChangeNotifierProvider<clsProfileContoller>(create: (_)=>clsProfileContoller())
        ,ChangeNotifierProvider<clsCarsuolController>(create: (_)=>clsCarsuolController())
        ,ChangeNotifierProvider<clsCategoryController>(create: (_)=>clsCategoryController())
        ,ChangeNotifierProvider<clsLocalizationContoller>(create: (_)=>clsLocalizationContoller())
        ,ChangeNotifierProvider<clsStateController>(create: (_)=>clsStateController())
        ,ChangeNotifierProvider<clsContactController>(create: (_)=>clsContactController())
      ],
      child:
        Consumer<clsLocalizationContoller>(
          builder:(context, value, child)
           {
             value.loadLocalization();

            return MaterialApp(

              debugShowCheckedModeBanner: false,
            // locale: value.local
            locale: Locale('ar')
            ,  localizationsDelegates: const [
              S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales:S.delegate.supportedLocales,
              title: 'Flutter Demo',
              theme: ThemeData(

               // colorScheme: ColorScheme.fromSeed(seedColor: clsColors.white),
                useMaterial3: false,
              ),
              home:
              FutureBuilder<bool>(
                future:clsShardPrefHelper(clsShardName.onBoard_shard).isNameSaved() ,
                builder:(ctx,snapshot){
                 switch(snapshot.data){
                   case false:  {
                     return clsOnBoardScrean();
                   }
                   default:{

                         return clsRigisterScrean();
                     }
                   }
                }

              ) ,
              );
          }
        ),

    );
  }
}

