import 'package:crfty_buy/app/app_routs.dart';
import 'package:crfty_buy/app/app_theme.dart';
import 'package:crfty_buy/app/provider/language_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';




class craftybuyapp extends StatelessWidget {
  const craftybuyapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> Languageprovider())
      ],
      child:

      Consumer<Languageprovider>(
          builder: (context,languageprovider,child) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create:(context) => languageprovider),
              ],
              child: Consumer<Languageprovider>(
                builder: (context,languageprovider,child) {
                  return MaterialApp(
                    localizationsDelegates:  [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],

                    initialRoute: "/",
                    onGenerateRoute: AppRouter.onGenerateRoute,
                    theme: apptheme.lightTheme,
                    darkTheme: apptheme.darkTheme,
                    locale: languageprovider.currentlocale,
                    supportedLocales: languageprovider.supportedlocales,
                  );
                }
              ),
            );
          }
      ),
    );

  }


}




