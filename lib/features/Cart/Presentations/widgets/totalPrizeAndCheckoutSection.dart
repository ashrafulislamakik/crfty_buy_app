import 'package:crfty_buy/app/extensions/utils_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/Constans.dart';
import '../../../../app/app_colors.dart';

class totalPrizeAndCheckoutSection extends StatelessWidget {
  const totalPrizeAndCheckoutSection({
    super.key, required this.total_price, required this.OnTapAddToPrize,


  });

  final double total_price;
  final VoidCallback OnTapAddToPrize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16)
          ),
          color: AppColors.themeColor.withAlpha(30)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total Price",style: context.textTheme.bodyLarge,),
              Text("${Constants.takasign}$total_price",
                  style: context.textTheme.titleLarge?.copyWith(
                      color: AppColors.themeColor
                  ))
            ],
          ),
          FilledButton(
              style: FilledButton.styleFrom(
                  fixedSize: Size.fromWidth(120)),
              onPressed: OnTapAddToPrize,
              child: Text("Checkout"))
        ],
      ),
    );
  }
}