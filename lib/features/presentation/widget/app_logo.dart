import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/asset_path.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key, this.height= 100, this.weight=100,
  });

  final double height;
  final double weight;


  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetPath.logourl,height: height, width: weight,);
  }
}