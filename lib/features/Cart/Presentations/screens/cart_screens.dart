import 'package:crfty_buy/features/Cart/Presentations/widgets/totalPrizeAndCheckoutSection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Shared/Presentation/providers/main_nav_provider.dart';
import '../widgets/Card_item.dart';

class CartSceens extends StatefulWidget {
  const CartSceens({super.key});

  @override
  State<CartSceens> createState() => _CartSceensState();
}

class _CartSceensState extends State<CartSceens> {
    @override
    Widget build(BuildContext context) {
      return PopScope(
        canPop: false,
        onPopInvokedWithResult: (_,__){
          _onTapBackButton();
        },
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: _onTapBackButton,
                  icon: Icon(Icons.arrow_back_ios_new)),
              title: Text("Cart"),
            ),

            body: Column(
              children: [
                Expanded(child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context,index){
                  return Card_item();
                })),
                totalPrizeAndCheckoutSection(
                    total_price: 120 ,
                    OnTapAddToPrize: (){})
              ],
            )
        ),
      );
    }

    void _onTapBackButton (){
      context.read<MainNavProvider>().backToHpme();
    }
  }



