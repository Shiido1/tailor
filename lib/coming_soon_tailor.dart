import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizary/utils/colors.dart';
import 'package:sizary/utils/page_route/navigator.dart';

class ComingSoonTailor extends StatelessWidget {
  const ComingSoonTailor({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.purple,
        elevation: 2,

        leading: IconButton(
            color:AppColor.textColor,
            icon: Icon(Icons.arrow_back_ios,color: AppColor.white,),
            onPressed: (){
              PageRouter.gotoNamed(Routes.TAILOR_DASHBOARD_SCREEN, context);
            }
        ),
      ),
      body: Center(child:Text('Coming Soon..!')),
    );
  }
}
