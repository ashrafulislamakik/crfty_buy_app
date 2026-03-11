import 'package:crfty_buy/app/extensions/localization.dart';
import 'package:crfty_buy/app/provider/language_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    final languageprovider = context.read<Languageprovider>();
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.hello)),
      body: Column(
        children: [
          // FilledButton(onPressed: (){
          //   Locale locale = context.read<Languageprovider>().currentlocale;
          //   if (locale == Locale("en")){
          //     context.read<Languageprovider>().changeLocale(Locale("bn"));
          //   }else{
          //     context.read<Languageprovider>().changeLocale(Locale("en"));
          //   }
          // },
          //     child: Text("Change Language"))
          DropdownMenu(
            dropdownMenuEntries:
                languageprovider.supportedlocales.map((e) {
                  return DropdownMenuEntry(value: e, label: e.languageCode);
                }).toList(),
            initialSelection: languageprovider.currentlocale,
            onSelected: (value) {
              languageprovider.changeLocale(value!);
            },
          ),
        ],
      ),
    );
  }
}
