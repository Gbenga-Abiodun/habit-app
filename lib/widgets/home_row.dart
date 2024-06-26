import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class HomeRow extends StatelessWidget {
  const HomeRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height10 * 7,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: Dimensions.height12/2,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.height12,),
      ),
      // child: ,
    );
  }
}
