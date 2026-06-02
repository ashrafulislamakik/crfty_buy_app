import 'package:crfty_buy/app/app_colors.dart';
import 'package:crfty_buy/app/extensions/utils_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sizepickers extends StatefulWidget {
  const Sizepickers({super.key, required this.colors, required this.onChange});

  final List <String> colors;
  final Function(String) onChange;

  @override
  State<Sizepickers> createState() => _SizepickersState();
}

class _SizepickersState extends State<Sizepickers> {

  String? _selectedSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color",style: context.textTheme.titleMedium,),
        Row(
          children: widget.colors.map((size){
            return GestureDetector(
              onTap: (){
                _selectedSize = size;
                setState(() {});
                widget.onChange(size);
              },


              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(


                  color: size == _selectedSize
                      ? AppColors.themeColor
                      : Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.themeColor)
                ),
                child: Text(size),
              ),
            );
          }).toList()
        )
      ],
    );
  }
}
